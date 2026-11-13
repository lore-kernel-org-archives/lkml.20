Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613294;
	b=KGGpU/IswmeyL3c8RYyYZ9Eg7RxOE6BU+2CKaaIdBqhKDa0L6roQQv3tXUlgDuCYb8yL
	 smPwN9NUtQlkZQruNI/UkNQoZ5u7d8ND+WYvxcyQVvivMrWZ0MAdKHbFlKe5UP23tb0wM
	 wzB1YxyrayyuwsjcggftemWsD2Xf3uPNPEh4/KP5EvmMDbvzlCcHvTKNPZ0Qkz/O5/TX3
	 MBIjwHR5yEVA2OlP+eZdZtX4oPzhl6jeTnFte7/n6j2ofJLalKu/+osMSRbeh7j6CGQTd
	 DzVZrnax+7Gv/BD5cCNxfZ/xx0Klk5033ETz+PSy0GHDzWD9FdtFWGqYpjpKNWLu4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uhP7NsNuTURvYeD6nh/uw0NSt2AXYerXW40hmLyAFU0=;
	b=AjwDFuxgagZn73qIFSMsztJPp44UNTsQoEJy6JTbwv4VBlDz11cQIsLH0bUAi8wUOyP7
	 QgZmijZC/VlDWrjd39DjAqu20mtsbRCfWyYkKZX2MSz22oFs1xhcstWLue/DGibSfQMhV
	 pvgunkEfVPGBdii8BV3h+5CgaohxH1J+o6bj8m6akmb1JYC9seO3rmxoRocAT7OnYkGtm
	 RXiOcrzCrNMN+ZEQvDBWjyRIBnweMLijF0M8wQzJjPycCHexAM7I6mJfr4dsKSQIie6ok
	 bMdzRYrnVxnPft6n2eEGWajF1LmadRZbS9w4g3GiTE2y8u0wIEWTMUL8qG/vt3d0oew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qu2sj+hd;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AEE606A894
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7AEE606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qu2sj+hd
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89d6bd67045so775427b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794613293; x=1795218093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhP7NsNuTURvYeD6nh/uw0NSt2AXYerXW40hmLyAFU0=;
        b=qu2sj+hdlYW06N5f/d4sV4hcAzCYdWk3j3lk+fV34nlII0vXpdosbk22gILAhYnUUT
         TTFB/iCYalGOLI+1sl84d0y8Y2UlmXFzRuH9sMNPgO/dbxqo8lGU36RgnYJDXiXa+/3+
         MkwTT2gcPv7uYZhFLvjuXvXI89yDPZZIRGQDbqCnwGbYIOhOsA756qkID4CRxN1xVkdG
         4z0KaaLRijsXSew3yEuTxTDYM5CPfxFb+Cf6h319eQYmk82JJqlpy5kNm2W5+DpAwFs/
         xQlsTkJi6Gll4HiNP8r4pMrbuW01+QtL7a7Z6zG5wxt2HzxJjrOBQV+xFBot905YHGR8
         KvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613293; x=1795218093;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhP7NsNuTURvYeD6nh/uw0NSt2AXYerXW40hmLyAFU0=;
        b=Pzg76C7/FvHYczdmNwWfc19GyPc/+8kHIbkxLqCc7qvnXrKcRaZdCCsCn5GqnpWhHy
         u7UkmGZeYiNqLtikoMjKOdyKHbVyPn/stx8Dd78M+xhrprUBEaGfTtDbi88JK+6w43Hj
         C6sC1xigl410Ac41CuCA4VxjeTs6O8QlbbrvLzOIgtepci4UarRK9POhULaU9P1PHS/N
         flXJLpGGH+A3aCZLBEiXYfat9gxhndOQB8VOmMmr9CW7DNuFiPrAn7x5gblxxs1ryfN2
         hyRr0S2+WIo2EtigpVjdI3FSJwxHsXKxzN0OWEVKQ/nMtbktUn2Hdj6eosd4ukV8UHPu
         botQ==
X-Forwarded-Encrypted: i=1; AL+hErE/wGEoSrBxhXZLbBTdmc5iHUpbVpR1FmGNHnAZH5pae41oHueQd0OzR5mRo1QhQV39fYNuA0EN6ZrmZZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cl/8XU1PMD82j24F4p8PXmbyc4Bb0dJhCKD8HwFLmXE8V5E1o
	p/LRZEs7yWNHuZXuZqKGv5CXZIJI022BifgqxMhR/28ntE2S+PgjSYA0pNzw2qs/ItM=
X-Gm-Gg: AYBFou1XG9PqRhhRJ9f4VvEGwN1ZGXfui/iaq3rQ1S6uAVM11zSL8bbd4q2mKDyeqR4
	yQlXS7hMrvABkNgA6irT/nCrh/gI24DcnO55V/4cFaiTn5A+jlGBoU6E69RsNSQ+ByUNpbHrE0U
	hdqX4NI7Ka2DTPRjExaZpvIE1rRVv4OYZqSnI+gCRbFrKAngweFVLHLVFaRWdOi7v/Lms/v3YZI
	DnRM9juKoQ9d8j3g5I509NdKRaq8SwcCIk63swChZPdLBgDgzN1lKYy034qGl0IoPdowaoippUn
	4oijurRa5dWgjfVZx2LP4eoCqQV1u9kWSSfekhbtf/XEUTAnUQrJ96tw/62OrnWtuhaoR2mE4U+
	vKzT7NsDhnlgHv2xw3LleAAFDl+bZ2XBQ+8Bvw8FJkBW6zhtmTlBE2Z06ns3jArPke5sh1yg96d
	o4rzOXn/o0lXvTHKE1pBP8RL5Cbst29u3fThMkpWgyBAdU1RT9/kKNJHttXXqhhvX9tsdOq0JzP
	IHDRa47iZuDzUOfYfHz4C01t/AyDLm4oSIq18QOO0i2LRk1zwoRAGuArQiPBaEDiuv6BoB7+Fvc
	RTp+GZHALN+VXMIb/3031OGd8pBycgXGHCQix5q2qCsS2A4a4zyKh7AaB2+3kCZmM+z74cF14LM
	MbE2GXbXAMj6feI9CxfTkWtsSe+ha8fBUTqMKhOY=
X-Received: by 2002:a05:6a00:812:b0:8b9:66d7:1016 with SMTP id d2e1a72fcca58-8bd62024937mr4783752b3a.8.1794613293130;
        Fri, 13 Nov 2026 15:41:33 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed205364bsm1768831b3a.33.2026.11.13.15.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:41:32 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: libiscsi: do not complete a task sent with a reserved ITT
Date: Sat, 14 Nov 2026 08:41:21 +0900
Message-ID: <20261113234121.397606-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113232322.395246-1-yhlee@isslab.korea.ac.kr>
References: <20261113232322.395246-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v2.  It depends on an earlier patch that has not
been merged yet, so it did not apply on its own; v2 sends both as one
series, with no code change:

https://lore.kernel.org/all/20261113233938.397415-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
