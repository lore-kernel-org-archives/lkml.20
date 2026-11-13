Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599189;
	b=CRPJcUyQkL52Xd1A7LDMAfqSAOyLRrOWEbIQOx9kJ+xdcTDrNqBdMyU+KaiQBw4HW5lT
	 gyCHds7yQ2dqB25hxBl7Gvu7mHOlxYRbsySQXTs7uYEuCFy/tu+MLKhAxbbVU19DDukZz
	 tDdw5kiOsPnK7YIeNsd+k67R2EcWPRWU+OEeWXg/RldsUwYTSgXbzvFhOnewemoKa0XEL
	 Fr3aAkSmvaC3qZJgFz7mdng57WMSd4nj7vNhS+2wrtciAy47Ot6Z83dpA3aGtjoWhgeyZ
	 XhXKMNVcxEJCxUGQKsWwvnkd5wl59xPm300pzST6O6mk0Of43XYQtWknKZDJJ8qKgzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bnFbcLg4xPh0sKDXQsE4qpXTpMcLOCkYe6dKlukYuLw=;
	b=XsKXrATxz8jyuxBLNi10Y+pEagnORmvrKDeDhqR4jtNcfnkNv4fz5CDSFDFAt/KEs8rn
	 /392X6ai7hGUW+Gkzc3LC9YS5HNoaXOUxeNQgn572ad1ebE6seN+ffUatkVZe6VjiYld+
	 KnRkeJHyR2DO8P0eXoHwzNpEACSCZTnrekgKjLfyGLPhtuU9PWtS34dcJYUTyi6TNJ4av
	 byvYiKchyYYg+j8+eyh/nPgcbXSIJxWHwdAw+pWo1zAZyksSFjUDdV5cCsShB6q/NhS+5
	 M3dMJ9/ZgEBZi0mzI1UonTgaiXoSlAXbjy+rAqvDsIeMLMVCEkHb2cRKTdGa7ndbnLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=lUXWgwOT;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC6606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CC6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=lUXWgwOT
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b394e2af9cso11106217b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794599188; x=1795203988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnFbcLg4xPh0sKDXQsE4qpXTpMcLOCkYe6dKlukYuLw=;
        b=lUXWgwOT0nkGaNixNWwsujzne4Bek6VhbLEYIq+4/GxurLCI0t0pvTn+G9P2HCpEtg
         B6qcag4rfJHE+G/2dfHYHrLbgLIYX2ybRQW/2X7//qE4a/V30/qIPhwTP2XeZ0kLHREs
         RWgKRrSI6T0hnt6UW0NmSzMdv3sFQx4q0ksmZq79Uuz35PsTDPHgaxQMrT3UvIlEu4Vv
         2PMw86rb6CVcl7CntVwrNeUhIbtOM+akuIo4i0dpB8Br+mwDZhPJoLH8a9kTL1r2cLUo
         jOlFs/nQyuhbxtH7Jh/EaJ3YwPY3Ls9oSJCVPwAmC7PpFr/fM37tKHLd4ZmHPhY2jhSA
         tpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599188; x=1795203988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnFbcLg4xPh0sKDXQsE4qpXTpMcLOCkYe6dKlukYuLw=;
        b=Lr+JuY5EorUOTIG1z79ThXShTn8i1UXGuJcRTm4qr5U/3crpcQ7NjT/Zm/5N8MaFbu
         46R1wMc1B5WmksI0EBzSrtTkW0JcpuFavQ1VbPrknxOrxgIseQ5wDV8rxm2O+DsMknh1
         0uiSAnG+H96i5lyX1tuGF5MJBKXgnp2/wDQ/43NndR1cIdC0wPOQm3usUFYnnSpmD6rg
         wEdyS5WST2swgmLWxZbY0OCyjDUU6Z1yoaGRcJ53eY34kz+YYtI1mniiPJsdgOUEbXQC
         HAnBNgiWUSAMJvLMHWtwUdKgCDcakK5V+4OqlT+E1sb955rFToZOerMpT9hAQ0wQFng/
         Q3Lw==
X-Forwarded-Encrypted: i=1; AL+hErHzaCtmORQyqOYoe4o6nkZhmoJuLTarqvDAkLt0r/h7vvzrv+BRWYV2qTD8dj0GXmonWKDFViMZjJyZK74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x9wJd9JEfD5u3+OyB/31FQ3kV2OoM0F42vW5f7KlYxvq5lvlP
	uD7UTKGhYsvKPFNYjiex5xuOK0ajH7HODZol0YsgoZexG6xls2i/nUKlGJivzcrGxA==
X-Gm-Gg: AYBFou3sb2DLomXDlNngBdXOaGS4umDAmxzKYEdUhf40rGRb4MmCz5UYt2r6VWVcJIs
	1TYO/RBeFdsDj07NfTVK/VDSG3u9M+d/FpvKbNFn0+z/uDCD3PhRhCaIc9mDvmVNkTNyPKy/kV2
	zs0lD21a33XEwTNUOYsDhIAkoJ939QCmueik+SUW7HoQ24lzNUyWqQgbCWEEoZWjOMsRJvNm/AO
	7uayErfs2TiOQrsbYYrtLu7g78U9hmWXk1x1iaUIJvVjjdKcxxpCXfV24CNbF8WlpB85xpZEjjF
	ZEA8R1CuVw0qJKeghQwPEU+8sLLgrcWSNWb4Ozx9EDf3KHWjENjgQOeuYyxouiOsbB/KgUc3lOg
	2DabunR3QSuH2JxYvnE4V6x/TJhPVhHisI7oRRhi46Pw2mOI/akKmgSQahrujie3HtOR4kK34+3
	yim6qDXkVwU5qKEKjJ6d0zKUIXw5c/Y04LsxopZsizHpcGvYYjjmA7EjEQEKvHauy7bzRbv5riI
	DzT3u8n5PCtOmydk+57ccKJisNzR70nB+uycBAMphh8E1zNwWesXCPdjsFD8/HC1xsutaou5Qa6
	hoYPajLz2xVmJLrTcPr0mn0JgLiIaJWlZwOo2ts08MlSV5fsHKYF1pl0rYoooOUw+DgjEEaY
X-Received: by 2002:a05:690c:c4e6:b0:8b3:2ce6:a3c0 with SMTP id 00721157ae682-8b4aa26fdc4mr21818737b3.26.1794599188303;
        Fri, 13 Nov 2026 11:46:28 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm28393167b3.1.2026.11.13.11.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:46:27 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Benjamin Coddington <bcodding@hammerspace.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tls: fix send() returning success after the TCP send failed
Date: Fri, 13 Nov 2026 14:46:20 -0500
Message-ID: <20261113194620.3830173-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179459891623.2168702.5534679656595552608@kernel.org>
References: <179459891623.2168702.5534679656595552608@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found this while comparing the behaviour of different kernel versions:
a send() on a kTLS socket whose TCP socket is in repair mode fails with
EBADMSG on v6.8 but returns the full length on v6.18. Testing
b341ca51d267 and its parent showed the change comes from that commit,
and I then checked the shutdown(SHUT_WR) and reset cases from the
commit message as well.

Thanks,
Hengyu
