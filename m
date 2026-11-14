Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626758;
	b=gfXvaQNXdm/IUQCTA/KA0WC5qWLFUV9UE1V7n7G2UvMh89t2oDiqt5M9qwukENhTuYem
	 kNmOJdXtryJJk7v4dlibZfLu9Saasbl0I++3pRQEbms5wtqFTYOMR4hetz99fQPWPlRZt
	 ViAR/DDqA/dO0VJr3E/FfrIssyZa48LlLNN52cr5KIRIt6IYXnzFB+ViwCHyNJ4V+kXUS
	 8PugQOn/OZVJTWejSMZ6QJDebie0sMAiDkB4re/7M0lgUh+KhTSW1dEFcDdvw8OWs0H8t
	 lc1191ASLLacZiby7ySkJ3jGDeoh1HYPHQNcsgSGGgyktjyGgpwEx9hXpfdNSt864Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626758;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
	b=l7AElQBD0YneaC4fCpsq08rRb/YNGSb3BvxMK1LN4hahVbLzNNLazz8Hb2sow7WFNN/Y
	 OMNpp9N+6LHQJ28i4Pkb+No6GuB1HXcT3ByZCo5GBkQmN5G+TEunPbOwo+rX8K0jYBr5m
	 gvnMpBXe7HhClnMvgNGDcc0zqhTHjJqmheScw4p3SHvmbqEPdQs+arkeL/JhPBBODZk1q
	 1OLvYyGGA/4Vz5y/5WxXZHBUloIyQOBBYaknZkDJlN2xRo6VEV+9rdCXKnUAK/BP5KDSy
	 4HJEaiIMyP8fR3TGUe/KMZjW9BmKjq1Pw7GyHh4wjnZv6uauZfRm+ibXlJROCi7OQ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ILSCDYAI;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD5606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CD5606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ILSCDYAI
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2167335a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626757; x=1795231557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
        b=QpqlLAgEscKg1+t4N6/r4aXZnHlq81rGUtEd9QNvacHn8ZoXQ3jRwJqWG7Y+o8+pCP
         DBm6js+6gXMbGImTccGv6z5cjBQTfz80lOR/ssGy/sd6Ov+9tVNQSGaVL+arXt6aM0Y+
         4Yyn1M8l/LgmhtXDeSHzuF3Oh1xDRoVYLIUcNdoot7wtt3COpcG9h3lj0Ta+gW81N+fa
         tFG1xNP/rHhpNOFroxuIZbV9QBpHgN9D+WTH5bauvhqZV9zf84bQeRPhnlLYOJnj8FX/
         JO6Cqh1rBXuU9KNlFQaOXT4US5nU2+liLO3olvpBB1kn7V56SeejAajZAuovqfoST2/0
         Ml2w==
X-Forwarded-Encrypted: i=1; AL+hErHmKPmaMxCWAKT9nnFr41gnYm5z2OB+Mm7dOIJp/RESv/J4Xyi4kNI+/g7M7c67aohlhJjdaXuARHy5yJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OVrQOhGNncIQP1/hQpRbI0sJ7iCVspfUe08/+xvlD6fRs2nCj
	F6N8PxwfAZ9Tb18GUA74nSg3SY6m6xebidFrmjF7vSymS8QBusY00+kb4Sjcwt1xKBK+XAkxn3s
	ukyFHloV8ZQt8TaKbltJenkZHxLLMceVLY1z1M6IV0QTbEO4RkEMkdCyzOkJU9STdAuuu49Iw2S
	YhA4upx5t36C2vYC2KoXLVme755djLvaccZQ0cv08SFOOaFwyIXUh1kqoBWTFxLirbjOTIov3HJ
	MwtjMIATPr2/Y4j7VWA5krf
X-Gm-Gg: AYBFou0HXa0g23wIer7TAhI+UkOLFheQNDpvdPZIlusRobOC9sWhfYXHM6G6UnysxLc
	lcOkwaZYkPYrHq+TOWLD8KFpn71FD01lzhvqFLM+sJc1f19tLLj6rdCgYTmJ/g45aeAkwwvi3Qr
	BlBNBFuQCASGoc2nXqyZeXfnhvc6nEeVBv8pzVLNozxwWh74EdpZfpA5D4lD26YIxGofwI0Vook
	qzO+cfN38P5Eh7o3bYKHz47uOCGNYiR8qyfCa8Gc/s11FsxIYOJPVUvuaJej2nGTDcIEhF1GTlS
	48XQz392jr4gyGs1f3NaNs6NVuXPH8YA17arVWko3NZ8J/CkLD6JcMnAoY6wmXqJYTr+j0V/YZU
	N12X4LC1/VRWyCGOXvjnABPT2/Iivr6WGH0+/Q4+SMuvjbTg7c50Vg2KKBG4C6Ln5hLsLC8i3lg
	+8G7wjkfv+zBbwNSCV4ityh7T9MPefPmkinKO5qoSf
X-Received: by 2002:a17:90b:1647:b0:3b0:9ebf:3ef9 with SMTP id 98e67ed59e1d1-3b1b06067e6mr4248796a91.0.1794626756914;
        Fri, 13 Nov 2026 19:25:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da174sm6943656a91.2.2026.11.13.19.25.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7001831eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626755; x=1795231555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
        b=ILSCDYAI0D7c7PrrUSpkWaR62tqFOIQW+e5Zzk8wL4foD7ST4HnJ1Jp86AqvHpVaVi
         jg8o/SwCPe+4B3U0WDT7ZS0/k261w9oXFTdllRcXgyQJDe/O3jwf6yG5LO3mWnT++MBf
         gZUJbL8xiLsTnEFVF5golJhAtMaD78SUolqmo=
X-Forwarded-Encrypted: i=1; AL+hErGa4QIZNRDufi0GwHox0AbEDUxnNs8SkYiGJVoxi3b1D/ws/1ORPvoOiwMuFbPdCAcyDOpDnljjPjsoy5k=@vger.kernel.org
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr4249923eec.41.1794626755286;
        Fri, 13 Nov 2026 19:25:55 -0800 (PST)
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr4249896eec.41.1794626754618;
        Fri, 13 Nov 2026 19:25:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm12221650eec.2.2026.11.13.19.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:25:54 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 06/11] platform/raspberrypi: vchiq: Register vc-sm-cma as a platform driver
Date: Fri, 13 Nov 2026 19:25:52 -0800
Message-ID: <20261114032552.873583-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:04 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Register the vc-sm-cma driver as a platform driver under vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
