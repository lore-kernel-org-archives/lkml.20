Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881418;
	b=Jm631WHlAvMy4Uw6/vZfdPRIh654kCFfj9aach5CBj6zBYUEW2TqSmTWDBeAl6Jjx0AX
	 Xg0IrqLDvLNL7eHhdxfe1y2AwNZceXeuKABD7ETCVpFFOuLCkk532P06KEYq1/bGKdrvC
	 ij+1x9AospuybEgp51UXkpEg6BRzr34JO+ceX+jNwyQrpOyiOja27HFFh3sEat56s93W5
	 fJuQmG8f+OrjpHcXWjDKqOopnzXNSbPxVA2KCUVLsKhtYb7sm0mwAt24K/5saH1HCMF0U
	 zGAN3vx1ZbtVehIEWWfVqXob2i1rsGZXmAfg2xXLmUFQ54uUnes/XK4Xmy6/wdPVy7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881418;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gdsxziGxpnrDASs1A9+YVSyfwFEePG9frypFab9AlVU=;
	b=LjhRkfI+sQRZiPzsacK2auwyMl9YVhGJl59fKGT7/I1nMwcsz0iH4RLs1RHmkTZm1GZ/
	 5OFN+1Mg8HjBRmv6Qsa/FPr3Av6V47b/ldt00QwoBBl9AlyVXp3vH8XoWElEPE/rFkjMG
	 JuGqPw+S8eB/Y69QaonkZBUs57J/+mW/D6VFVTJGRRPdWrF1rTvrLvSIQ+ZsimN/WT8+z
	 cyx+nX2WXyOGb//D9DFyDdIoTbUFpTPlHpKwpnWJ7z2eFXM8B3r+SQRN0oWd6+45ulAQ9
	 Mp1cVC+f+AywbSIWBeQtwmvgfa7Yka18v1yErp5ddmVmdtl9mfCJSOGtyWL/rI2OG/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="Fsw/KBHu";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DFD606A31C;
	Tue, 17 Nov 2026 02:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20DFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Fsw/KBHu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gdsxziGxpnrDASs1A9+YVSyfwFEePG9frypFab9AlVU=; b=Fsw/KBHusB+0O7hSpR/W8sU2Wc
	JEmltrjwdNNi63acBpxPj7DzyWZyz76boh532QxlKGNQeoBsvPtoyOuWlOV44gG15W8bSzGzy+Ykb
	NHFF6Jd5tbGQIPKUGwUZ+fwcNer2J/dbmSKxCyhvR1GsWXdQsrYLv9GEWQCvY6CylGjI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT8eC-00H3HL-0t; Tue, 17 Nov 2026 03:10:12 +0100
Date: Tue, 17 Nov 2026 03:10:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Resync SMI slave before
 register access
Message-ID: <c5f399bf-4050-4c1c-8a5f-b983b321b181@lunn.ch>
References: <20261116162303.1368472-1-mmyangfl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116162303.1368472-1-mmyangfl@gmail.com>

On Tue, Nov 17, 2026 at 12:23:00AM +0800, David Yang wrote:
> A register access over MDIO is 4 frames: 2 address writes followed by
> 2 data reads or writes. The SMI slave tracks the phase in a state
> machine, so an access interrupted between frames, e.g. on an MDIO bus
> error, leaves the machine in an unknown state, and every following
> access fails or acts on a stale address until the machine is realigned.
> 
> The driver has so far assumed every access succeeds, and relied on
> manual resetting when the state machine wedged. However, without a
> dedicated reset line, the reset itself goes through the same SMI
> interface, causing a chicken-and-egg problem.
> 
> Realign the machine once at reset, before the first register access.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
