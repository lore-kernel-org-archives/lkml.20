Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C062CCC5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770841; cv=none; b=o43i8qjvPB3EdUIH2FWASwl8gonz99pTMUn40cehKLRyWv0i0Olpw6JYaQdmVtqoIXLmF50dsdmICKRx0S9fkhFE/6LhsVU14HDf5oEvVMRLnbzRfhawcQrRvHJj2xgZDcn/jSBZx9HSuhs86M7S/K+/9EByVU5q9b3QrNeKL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770841; c=relaxed/simple;
	bh=INJqXLOzCeVe+xylhlZPh25QRwnRX/J/LaqLgwxpFIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a0G7awap+aIAO6qtgh6hyaX8o7E1x1A323JnTob36iSwUuk2na6NXMb343Ir7c9ejINRvxATl0Xmry3+LYYGgjFcsSPphCz2plQkZd+5Edvel3hfTmFD1nlqG5oVlnogIPPsmxm7f6HTh1VQpr2WHqgd+RmV3NRVzGr3Z8jfmH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKWTpMf9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YeQHsi/p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKWTpMf9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YeQHsi/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWIbl+NqjxFa+j1OOuPSWG4PAJNtr1JvOBX6u6e7mMM=;
	b=CKWTpMf9T6ZwsHG+tNby2ba7BqgxB/a2KzY7tM73i9ykv3T5F6HfQtd4sNWhsRvAdapspL
	OsZT24Q/ohIc7wpIG0cUZlY0HoddlsEm4h/9GLtnh4KvlYlX+WB8P2DkkNzzhzPlBrnTo8
	w3zdXnS9oQ/4FNPjlZyGeX7+oX3XyUs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-ncFKlmhdNNCuw7v5ZyDbIQ-1; Fri, 18 Sep 2026 18:33:57 -0400
X-MC-Unique: ncFKlmhdNNCuw7v5ZyDbIQ-1
X-Mimecast-MFC-AGG-ID: ncFKlmhdNNCuw7v5ZyDbIQ_1789770837
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso191680485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770837; x=1790375637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWIbl+NqjxFa+j1OOuPSWG4PAJNtr1JvOBX6u6e7mMM=;
        b=YeQHsi/pqAu8uLpzWWTPr6y7fyEmbafRRh9kHLSVocnL7sMhwWTiuFkeZXUMupg+Sw
         Nzve2Ge5VeK6RL6uhANzs8fv6lI1NH/qpH0+kTVe8Emjh3YP3b+1i/0189xp92cwyYGm
         OkX3+PSv9j9gw1aBdbVybtISMMnyqXRZ6dY5t6pZFV6k1ApTDjHMgVOdjwMzRW5dic40
         IRwUVyTBo/+7eEq5ZFlqW0/QLzLT0Wzu/4emF1mnvEiQJs8SoB7ol0NvqKS5VokP+9AR
         gV+onMQHr5uXwogG5AUe8JWSppg8SiiIUNvjNyVyi7EeModsSL7rxnMG5yKFhehGWbBd
         pn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770837; x=1790375637;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWIbl+NqjxFa+j1OOuPSWG4PAJNtr1JvOBX6u6e7mMM=;
        b=yyMLjx7i/USrUVGwbHShIWcAuFmHx6iwoYnOYDNGkml02WTyYBRhR9hykFCteUdw5r
         hHjGr3Ve0Lgv606YEnJoPOtBpYWwvOBrVARg3rHjzk8xgONBSVnE5YlJUmiR54iswEH+
         L9m1lj+ujBNfwTsFkUkjQTiIwBpJn2qAY3Zc+tIyXBQB+ugSrHoqrB0JHt028uNyyv/v
         AvzGmk7D/FCdzMrhsNaKWSK32Qexu4uleCjrfyA0Pi3V9FH+R20diXYvRsB9vfG4V+Nx
         pyMqUZ+olqAKV1yxL/TeaurRzMzzjfKz9ZyWQZ6SuAuOxnVx4sD4RYK+feDbG8yGI+S1
         83Rg==
X-Forwarded-Encrypted: i=1; AKwUvByU3onzmiY7rIOTTB16nfaxc8NO5qOvAUT8sM5Qjy9KvBOXWTEkV92LtTkNXhQdeVXM08xEZTFIcCAVqts=@vger.kernel.org
X-Gm-Message-State: AFuF++kmXMHxx5DAqI1mAh+cTg0AdZItPa7EdxBR1CApNO8Nbi9gIBw4
	50RL1BSxkcTKM4W0ErBSkL+4R+EOuSDBzOKHhB9YPY2bzCKBvrk0y8ipGdC6HAo2Kqfnx7EmOK6
	PYEsFV8+oq5VtVCq6Z3cgR4bGIlXh7eVPNiZD2OTZVb52q/6s6o6BSTEtb0k1NbMsqw==
X-Gm-Gg: AYBFou3TwldxLrgrFWdDmEaPFw0FaHuf8tKP7yy2imGxSEtI2fJy3hqndx60L8oIWY2
	guTkxkzZMn2h2tQAKs411S9StI3enbIcjGOW7eWJp8mIXBNpdlRrarBtnXSITgPMEr4f+StETtF
	e3f/5fbuNGqKg1UIRTjiNRQrQVrNouFY9HonGXorWvap0zSlwGeSfAC7q2/5fdTUmNgzAU5ew9b
	t1fQKaD1EL38zq4YIev40HAFHV1B5+XIL0+CkrBfgT9Ie4Godo9zM7O57mAQBV7bEluw/gRZncC
	WG7BIZKO+OJwk9kpe9zhG6TwO7UZ0+b05NbhbRQMod73k2rUrMHha5SBltte6PPAoO4jgOyd/A3
	vJA==
X-Received: by 2002:a05:620a:390b:b0:93b:d7a2:dd30 with SMTP id af79cd13be357-93bdca2f41amr674809085a.64.1789770836677;
        Fri, 18 Sep 2026 15:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:390b:b0:93b:d7a2:dd30 with SMTP id af79cd13be357-93bdca2f41amr674805385a.64.1789770836227;
        Fri, 18 Sep 2026 15:33:56 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bed720979sm52774585a.3.2026.09.18.15.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:33:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: kernel@esmil.dk, hal.feng@starfivetech.com, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 Slavin Liu <bolin.liu@seu.edu.cn>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
References: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
Subject: Re: [PATCH] clk: starfive: jh7110: reject oscillator lookup errors
Message-Id: <178977081281.517928.6939892827902684127.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:33:32 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=310; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7EWeT8I/x8N3qDmNa8W41HSYuVGHBmJDoXqc4/tpGtc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7gl49870YOHjnHN7/7EFnen6kH5k9WGpQ743LOWvu
 ZhUX6mc21HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBERGsZ/ruceyawPvO93BNN
 7U2B+o4xTK/4jOW4FfazFz0y8sh4xsnIcOrrpiPrXsaq/5/9uyXg6Enb9bkSj9aY3Yh12nm1ZoX
 PbUYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 13 Sep 2026 20:51:12 +0800, Slavin Liu wrote:
> clk: starfive: jh7110: reject oscillator lookup errors

Applied, thanks!

[1/1] clk: starfive: jh7110: reject oscillator lookup errors
      commit: 54d0b6903921d121fa750546f2b38cc3f5c7e64f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

