Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13D2D77F7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769556; cv=none; b=A48gneKFB7WFUKGxXYvdSz3H91Og/alZ6T/8vEGc3UEMXFVhIT3tmjPu3yk/XPOxpUxJ0IQaYenC8UcBdSM+Al1jK9fxH8egNnLIkFzzqRTzxIemG6HYOK/j+YnrUkjU9/ccmV7xPfV+Zc9x6j8tbQGW8JQpfd9JWQRtyqyTCXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769556; c=relaxed/simple;
	bh=D1L9+mE79Zv8ll2clGPFF6uU5wTqQvjLxHYGh7wzOww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AyMC/pCDrfaBDu7YM3HPLMAMDZWJk++rO3QVHIMQvLrIIrT0ZTouEoaLnVrHC+7p7/MYuwdQySO7fSkO2oCWBgoRogrM5mZscm9f5o2j87Eynd++hXznxNxrRjhd6IruPnSXb/sx3UBu1CkeH0xLVwwSrH3oZr6tHYqmO0ibMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cF4QbZ5p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0GiTE6+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cF4QbZ5p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0GiTE6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789769554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4B71N2IefxaDBJC5J7wDGnpZnwTMUCJ+YZq+Dx6EkG0=;
	b=cF4QbZ5pFsA0Y/dcWPC/YWu7G7H5yej6FkE72QQuLDNebQ2vwa4JfedDGLAIibt/12Z5m9
	USZDcYRRG9I+Yupl51GRLMpPzZmXTliddA7txp2dNI0+QEhnBsVH3YDE3Vn9oOKbMz5JGC
	n3ysk4uIrGQYo3M8zgU5YbW4jlIHuOc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-HwIbX4ZPPoWhryCMhMCUNQ-1; Fri, 18 Sep 2026 18:12:32 -0400
X-MC-Unique: HwIbX4ZPPoWhryCMhMCUNQ-1
X-Mimecast-MFC-AGG-ID: HwIbX4ZPPoWhryCMhMCUNQ_1789769552
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce8ad8002so25436796d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789769552; x=1790374352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B71N2IefxaDBJC5J7wDGnpZnwTMUCJ+YZq+Dx6EkG0=;
        b=X0GiTE6+Y82ohnSDeSIpOEC/uPocgbCFTDhIh58z6qf0kPf7P23b1geByxJrgCDry+
         hgMAioUw/xeqeb4iSS2XxgwtLbMdZxHMgsgT9FGx/JiKR2U7EhS/GfBGTerKDOYYmDwC
         CZYk0JwxATpq7h4FIe7TgR7s8Ehw6BIV4MTpYZHJ5iucdzLIPJR2xWvRPWXmNRRN9F3z
         WsWPeCuI6o9ujfdyGsOrakYBuLXvyBlJXEZNfXqObTFyIrNHUBZsjrzsa+WV/EYbWqYU
         HyzgfrL5cwmchiqTZvJ6Ay6sESZrEHh2JbFf3eeHCheXiAYggZem27HaltBSZUdIKSp1
         zL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769552; x=1790374352;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B71N2IefxaDBJC5J7wDGnpZnwTMUCJ+YZq+Dx6EkG0=;
        b=dTu5z4wI21VDVz31f8DzY7BJQPdou6v/6ao2uoXAI8dn8fF693+p8DbU5b7KJcn/DT
         Z2R4lyxZMb93Na7pnEXl15SP74QrB6NQ3GsTvdaHVMYIzuohEyJb4tbsuCfnIFDUqOFr
         4bAoJX1BD0JRJg1OSg2pLLoscQjtVGSCkTj4lr3U6ESGa1Op42xEHazrBR0QxXHCOk2n
         jDFsxvn/zS//Fpyft4A94gArjjUdzo96unGWlqNTSmgiid/0IPRGghvk1wyjouSq3WuI
         iytuqeMQOOWwMYx2+B+56+ewTG6/EQjQkvCpCKjCzlbih2QQ8sh1J4wQ04wesKWPhOgi
         8tMg==
X-Forwarded-Encrypted: i=1; AKwUvBxgUT0bSk8gdQTMDOxC1ROcaqABPWdHDYkcdHtNtg4fJPajVBWbwh87LXJnxQMexCgKJPvF7T8RriXhfsI=@vger.kernel.org
X-Gm-Message-State: AFuF++mu6ztSqmRhz8zDEQzOVzc7BwqT54mgZNJmblz2KL20XiGIxAYp
	gbnJrYLy5fDW9i8Iul6gXvevQ03zJoQz8hMbSfYTtar3rlsbAoS2Lznb6JfzbetdDPnr42fj9VH
	D0ZphQ537nVtWcQKvZgW73XZ+jlJMueWZpOriq9BH+L6EgQ2GmaWkh/F8q8fQtFZKIw==
X-Gm-Gg: AYBFou0LBeXBRqHdvTS04u8gKeztClxZAYqniPFYIu7MgMDqBThKiFycYIaVEHwVQfG
	O2uYhjsdP/9J4ippVj281PmxE23f14bCwSzfgpBaWhvnVBHfGXcGAcahFjD7sKgFdU8E9UaLmx7
	8OPqyVi+p+MmN8QnVmeqk1rJxlvllWNH9+GCiJt+eY9U1UE4lzRzzmJ5YLUGW6uu5hkQo0GLEuO
	iEeVTFgs3HG6Db2WuSZrr/Cnv4CehN5sYZ/+jzwD3yKjabkhth1BHpMnxdEre+XqZkctEuB5p6s
	fzQs63uBsYBAe0HZpWC5CXgptNp2tuL25LvlfjIt+v6PF0x3j1B9zUpEIiukfKMkRSIEWHE7KMo
	F7g==
X-Received: by 2002:a05:6214:842:b0:912:517b:40e5 with SMTP id 6a1803df08f44-91254c23ebdmr50096996d6.44.1789769552137;
        Fri, 18 Sep 2026 15:12:32 -0700 (PDT)
X-Received: by 2002:a05:6214:842:b0:912:517b:40e5 with SMTP id 6a1803df08f44-91254c23ebdmr50096696d6.44.1789769551717;
        Fri, 18 Sep 2026 15:12:31 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a85d40sm5857696d6.34.2026.09.18.15.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:12:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 mcanal@igalia.com, wahrenst@gmx.net, linux-clk@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
Message-Id: <178976953851.517928.608099813056802263.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:12:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=323; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SBf0+CgjodmBLbd7LoXpbgatcqyYs36TBu2fL/e41M8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWbvfobjxq3Mc0R+7p7/Mq1YZ7f4S9W/2p+ZCYg4y8B
 7fukRPuHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkdBojw+xrVQrlS+/Velhs
 SRH6cWphhfHU4sNaGjGhi47HGTque8LI8GZuyo6FT59o6rm2pRv7yaySXjaz+NKe1I2ie+KNUj9
 O5AMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 18 Sep 2026 11:41:30 +0700, Triet Hoang wrote:
> clk: raspberrypi: Handle cpufreq device registration failure

Applied, thanks!

[1/1] clk: raspberrypi: Handle cpufreq device registration failure
      commit: e98e3d712023859af7cd78bb7fdb87ea3a9ffb83

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

