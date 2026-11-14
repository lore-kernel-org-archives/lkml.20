Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691682;
	b=Mn/xSmRV5FLQU/wzou2bBKdrKC4U6jsOxTPiF+ItWuh41jrvr4U0QN7u6mY+n1czH1a/
	 WSppVgtymG+XIDaovgI2qc0T+q/YR9JU2pRnhVqt0EN/seXrYNKcMPryw1L3WQ2djigWF
	 2hiOSgHUk1ZyWbhw8pfsj8NlVoM6piBKhhJV/U1OwGqwAtW7z270WbYqV8LgvCITfWVMf
	 hJEl+q9O872HX06Qbqzfo4c8OWhpb4j/L1Q2Z5gLWx6MbaiZVGzJfkePz8Fytd3SFZVVS
	 I3XDiKLaomLzQKg8VXytHGvUxNh1Cu0EWWm126d++hoM5Fl5gGqW7dLyW7Xz0SPU/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691682;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=aVQSe+ztLuuVQxQ0MYdkDhLji+45l67wuJIEeQLK6Nc=;
	b=UNoWVNJvmXPneGUXc52bJU5g+OAHK/quLkCrfwYDVrfmwsx72ayABMwFfnhZ0MDaiwUj
	 fBKNS+1zL7SruL25qNX+JAWWz/6eLf4npdG1g5zm29GoFLa95XBK3Ildf6Fy6n12Q+3+H
	 t2bf9HI7Oq3hXD/nazVxP3CFwM7GXBdglonzgDUWkxSrBrtVOp55rl+M8UmLvF359Xngb
	 UR/KFtJegY5MokbAq7/Sx3uv0sPKX1hXM1U+rPJ+mJCNJ9dImwoSVvJnQDexwtJWNnUT2
	 QF48AOpHweEmMAkwOftjoM6yTVba4WMVk3qK1t9JKGs/JYZhDLxy1soPBE+MEpLROTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DgnE4Ee7;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D37606A327;
	Sat, 14 Nov 2026 21:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DgnE4Ee7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aVQSe+ztLuuVQxQ0MYdkDhLji+45l67wuJIEeQLK6Nc=; b=DgnE4Ee7uhkBmka8KpKaXwmbBi
	48+4IBQBLw/PLaqJSL7yTQ1Pqos8ame8T9jU5Uyjgga2oYy3sX7LQMzeACdd5HwYHHIk+b6BejUOR
	r4gciBxT90LdmXOrpxpOzNx8cH0MDh/rkXJ3TDxksEG6mk2U+U5l/yuK+DHNb/c4dGZY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSLHl-00GXQr-37; Sat, 14 Nov 2026 22:27:45 +0100
Date: Sat, 14 Nov 2026 22:27:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after
 interrupted MDIO access
Message-ID: <d03e27a4-4777-4477-b827-0fda7a112ec9@lunn.ch>
References: <20261111163954.1132921-1-mmyangfl@gmail.com>
 <54eced73-d0ee-41da-9ff4-63aa88667d23@lunn.ch>
 <CAAXyoMOokp1yJYKo-r9MFehrVTLcL9+eQQ386Ycwmw0ut-KVYg@mail.gmail.com>
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
In-Reply-To: <CAAXyoMOokp1yJYKo-r9MFehrVTLcL9+eQQ386Ycwmw0ut-KVYg@mail.gmail.com>

> > > @@ -136,6 +230,9 @@ static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
> > >
> > >  end:
> > >       mutex_unlock(&bus->mdio_lock);
> > > +
> > > +     if (res)
> > > +             mdio->synced = false;
> >
> > Why defer the recovery to the next transaction? Why not do it now. And
> > if the recovery fails, you can report the transaction which actually
> > killed it, which might be useful for debugging.
> >
> >        Andrew
> 
> If the recovery fails, you have to, anyway, try to resync in the next
> transaction, so recovery here does not help other than adding more
> code.

I don't know why it adds more code. You don't need mdio->synced. You
just call the recovery function. If it fails, it fails, and you assume
the switch is dead, but report the error and keep going. The next
transaction is also likely to fail, probably causing another sync
attempt, which might work, but by then, you have to assume the switch
is wrongly configured, even if the transaction works.

	Andrew
