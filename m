Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843075;
	b=RB3YEaJmZV0C8cCeYeNA7qGAEn+4OOtqX31TDyYns9bLkAMuknyoQtrOM+WZwSwP1JEt
	 0IM/aNNg2GjNxaLXo0rqtobzprs7RkdaUIcMHHni1u6bijyIshbJ+kGrMnNgGSjKg0lOT
	 FVGumsIgfklo741qJlWrgEGTZc2/7IBBdBF0PIQSVV0H8SKO3kazPTgQ49hDvAJmPR+tz
	 3CQnN4vOF9VbhrxpoEC9SQ0InHat4zAUvGz8ke4rTGixNSgLznLRgBYKw+zId2nQam9OJ
	 pOi/iB00l+OPmryg+PaRBrLV23WP2cX1F7WSTDpHfTGkxxJXBJ/cBSVx92dQBFmPzag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843075;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=Q+cjqxjigLuAD2G4MU0M+9cOYkNU/IcSxXyfqVz+dbE=;
	b=xfr+Oq5LlAa78xbdyINxwiy0GUl545X5B1que9pgyADZ4Mr149g2V9RS/znPOiAAr/37
	 LqtzcCx6OiTh/HFk4ckp0wDxhkZVaJv3x3/QxnJIy5S/rAR6N215q9DcAPuP7fiQSIxVY
	 NbYfSmh/LtW4eSsYeKu+dJrQhuZaFM/lqeQDDp+iVQkWQXuhjFIMz6QiDXLAMI73SLfvW
	 3uAJ2O6iiqpAdFGBcMhSXllmDeNyIsgHS4VsbnC4Yf9PoIv8in34w/Mg6EgmcrDqd5E3s
	 ESXSP6CnVzaYZtMR2UIDz8jFl6KYdoledA7qNzV9NzZdNIZJ7MNo6TgLYWdv+34oJ1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=SmGPb7g1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19FA606A32F;
	Mon, 16 Nov 2026 15:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19FA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=SmGPb7g1
ARC-Seal: i=1; a=rsa-sha256; t=1794842902; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bM1uQcnycURqx9K2nvscA0G7J/bKbUhTiUBH/bqjTeJ65gL/xlJCnvwKcPGXVklLhSbis1w4sz2HWucvFyDnmExZSov08IiwFQYP8fUgUleVDnNBIoaqHf8d4X+/Y+aOI6Lh4Ct4pVx7BtuU8aNlA0hDGikwtJO/Jp/dQBOO3Gk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842902; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q+cjqxjigLuAD2G4MU0M+9cOYkNU/IcSxXyfqVz+dbE=; 
	b=gNVW5d+HpX7PSq3/4FyqNNpo5zoxLNfzYVtfkXf055S9JKGgXPUpxHXkObNiOUXLEDbsIsaPa/AX7ddeRbFDRSEnby5kcQwpOJhevisGvcqsQZL4kZLLE6QtpV2K/ZfsPKyZSOp47IpuAWgsdHqXsIE+b/cOhQCLx/zKF0b8pYk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=SmGPb7g1nQFsuPi+TW2GM+oO1Db1jA+x2rvJnJyQaFfvQJxDZ7hzU1Ka0dQ/NutbkrhHKN+jdndrsjh1dn+ycaB5UEQTggeFK4LvyNQUKh9C2KgrQ/2WuPL/3mvc6VDC5m8lrT/JGFwEQp405S9KGglaiSR7oOi4NcSDohxvBTKyPlkQ3RY33RqwUMIVoPWhkbWzrNlA+e8t7ATBLzHSK3KDRoPJmFsSMBBTAhy0AB0VJ1wVH5Bz6xJCU98DqjO9VaXb120Oq9WAvLltAbyDZ4dF0XxXEBEeK+LehXDZoeSblQf+6Rr59KqL0Mu2vSf/9h9u+ZH7xr0sxHzSPLxXIQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=Q+cjqxjigLuAD2G4MU0M+9cOYkNU/IcSxXyfqVz+dbE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842900999920.9112925704835;
	Mon, 16 Nov 2026 07:28:20 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 04/10] wifi: rtw89: protect pure_monitor_mode_vif with RCU
Date: Mon, 16 Nov 2026 20:27:56 +0500
Message-ID: <20261116152804.781-6-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <ac552fa2a85d421eb5828f85366162f3@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-5-owner@ph4ntom-rev.uz> <ac552fa2a85d421eb5828f85366162f3@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Nov 15, 2026 at 04:00:28AM +0000, Ping-Ke Shih wrote:
> Did you actually have rtwdev->pure_monitor_mode_vif for the case
> vif == NULL?
>
> For wlan0 + mon0 concurrency, there is no monitor vif, no?

Right, standalone monitor passes the virtual monitor vif
(vif != NULL), and concurrent wlan0 + passive mon0 has no monitor vif
at all (dropped in patch 1). I will drop patch 04/10 completely in v6.

Thanks,
Enver
