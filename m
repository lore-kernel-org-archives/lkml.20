Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407344;
	b=dBJri5a6OSyLYToBHO3jwrV/MXb3TtP378v01Id0i1hUpnE2rr9cx/8zRjh5Am+oMVY8
	 8YjsWxeWguNxjG9sYNrioLSsW2w+YTqyOk3s/MkEMy+ZPdtSSK5jqso6RSP3sZJmPCWnE
	 EoiIcXOsMKxxTeQySWv93N2Bs7uRVQvnYuwMYSSRQoi2exWH3fQHxKZOaXVJaSyFjmo/8
	 r0rMi+ie2B2Xud4THaDmOUCAGbGBXparEGN9uS0vrZe0xmYVeapVYlP+84EVnKccgLRM6
	 qGI1GYUQkEm53H177u6mF3r/w8vlmCrt+rWllXu9AGSA+7sHaTRWi0OxNtyno9GG5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Zn8ogGo3EJrK8xLaTC29uAmsx2DQ8Ou6DfNANGyHlM=;
	b=oZgcUl/jECIUaWO7m2VANN2gAW42rs9OLXuI7WEnleRyZgvLfaql47oWh5IuqqCWn3qk
	 RmnTiniZEllsnl6K5qhLNjy1T2JAjUx4JCvTrFbDQqBko2PRbx3ln+HLjHczVHCb+nKWI
	 nNlg/eK6XRxIc+E07BHW9EAc56X1BSdJ4JAHG0FMC8MoyOFsuVhdRrEqHHPiIq53KR1c9
	 YUPimkWab1l5aPxQ73cO2/070lZ6o0+yA/ArLlzXjEIziUap/bdPADuf22Ku8fc16GJxM
	 Y3lVyd4BVIB8x/oPwzQUZWhcLad1W6Vl9FqixkpeF4TRYIO/KDgujciLEOBLQnYHpLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDJUF5HR;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DFD606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDJUF5HR
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso620233eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407343; x=1794012143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Zn8ogGo3EJrK8xLaTC29uAmsx2DQ8Ou6DfNANGyHlM=;
        b=lDJUF5HRQrNGcGOXShA4FcSRi6t1g5cq5qrr1V+hZFuwmkwlPaj+mOE/Ralxw5ujyJ
         pWsIo6F0SoXvQwSAmz+VCM0sGfwVkNC0T0KLZyJaBNXjhKSuo8zSDB+LDHEl3EG/z/7G
         kBV1LFgN91+PpAJCRmiHSMZkGKXEr+fa5coR+8qZ//C/OfWDLeh6Ng9kjqZcVAhLoCmt
         BaPOfmYO/OITGkli8NkfGVe2wjPfPEtL8+OP4x5emUc/Q6ZFkiIQeHdv8gGmJtQa2oEU
         xaJPd4gX65hxJUIok73Kl96O77GeK5XpwUlxhKFUiCcna6Gk9J4e+pUjp7qN/7+Aa5Y4
         CqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407343; x=1794012143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Zn8ogGo3EJrK8xLaTC29uAmsx2DQ8Ou6DfNANGyHlM=;
        b=CkkA4x2pFwxXNExCJOL1aDzwWMb9qeXzfpYrKU+YDgUxC4jOHKKTubBGYqAllOfnoM
         zym2Vo0Y98zRUwDQ/cuL3SQJSGP1kflHYSmPM7AEvPjF52oT5/F33E/h3VJF/Ir5W/vz
         qgHxS2CN/uKcpVksRXIWM0jC8GwuSLqvyqfGhHUvFOc3Pk91/vm4gAHZUBNROBXPNn8q
         zMTOEzGsGvm1TutlumQZcFTtsFZRArusfkZ9bFrr9uENzaEc7C5mOBip9S03QFWGGXmt
         p56Lg26lLD+943VA1WLrAJRzFGFBAfdc7EXL9HPO8e4igYNQn+QQv2ss2UaJxCEKcRnz
         FTJw==
X-Forwarded-Encrypted: i=1; AKwUvBy7JbxQnXhBoEOQT/0YkYiMH7IAQtqDfdfab0vWUMgMgr0k9BKToYJ1PaEqb5c3OOxAFoXX/JlwrZ34Cj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg8Oq3Cfe4eHN9D5TMSZITX/mejQ638lF1mjC4vR9buJIJg7dS
	bRZG0wUkfjRzs7YoBlo3TxxAiIsscRnG7cVRiXICA7WKDAJhpR0W6YjZ
X-Gm-Gg: AYBFou1ofxKt7nj+3OoFo671cUURS33mFAWWXoew8BIz5uPALmLBjM5c+h+p570SDQ4
	Z6cWSuvbHFonythDAJidLuBZZNZpdi4Ul2D/XVr7QdLhqA031KV36a8I7offz1NkiTjKK1TXXXn
	czby0D3aLon/J51PGkk+K5qcCm5zo3S5Me191T5v6+yUkPnO5RoFy+adfrTwX+2qKd/tgcTijIw
	Bwgc4IOl7dQHFNtJ7n/BoA1zS5b51KW11VHLTZpugbYxtUgzX+SVAKriUsvTnOpDFUtgMnAT6If
	mAGGpLht0veRHcqVjFFu6djQ09/91aDrWH4SoeZxWA17JlG4YoUWU0aZPgCWPEwRuHnQi8fHkLI
	JWrnjKgLpvWaAR05VkG6dP/yocNpCO8441RgfFqHZgGjSwlKKk0T/INrORwkvmKxb1wg+4HHLq2
	9ilwpFvjS59cu72P40J83UtReMpIcmlqMLucnZBTS+MBJ7RnvzdRnCwG1GYDW+GeSks2y4FL0nH
	pQfACt1Y94zIw6ewpmZTnQp8BX7Q9yZZjrilL6gTYsKakQCJbGA7vmMsMe5PzgpsOB1RNaZyHvo
	s+SwrLxcubJ97L9zIjr+CMduWtA3kbAb4Xn7RiVzfST9LxMrgQA0uwTHauhQ09F3ZNGI7Gmrf74
	YBA/+T6Z8NI9/JDzuqTn5wNIaNOdYokKDiD6A+O8+MF5OOTB+qaCXp6u6Qsk206yyW1K0/1twz0
	M/IW5G7uXhWNNKJgw0
X-Received: by 2002:a05:693c:83cf:10b0:36a:1427:3933 with SMTP id 5a478bee46e88-36a4236e7bemr6281218eec.16.1793407342986;
        Fri, 30 Oct 2026 17:42:22 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:22 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 0/2] tty: serial: samsung: RX DMA fixes in stop_rx and the RX completion
Date: Sat, 31 Oct 2026 00:42:15 +0000
Message-Id: <20261031004217.3340610-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series addresses two RX DMA issues previously raised under the
release_dma patch [1] and subsequently confirmed by Marek Szyprowski.

The first fixes s3c24xx_serial_stop_rx(), which incorrectly pauses the
TX channel instead of the RX channel before reading the RX residue. The
second prevents s3c24xx_serial_rx_dma_complete() from re-arming RX DMA
after reception has been stopped or during shutdown, which could
otherwise start a new transfer after the channel has been terminated.

The series applies on top of [1] and has only been compile-tested with
arm64 defconfig and W=1, with no new warnings. It has not been tested on
hardware.

[1] https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com

Samarth Narang (2):
  tty: serial: samsung: pause the RX DMA channel in stop_rx
  tty: serial: samsung: do not re-arm RX DMA once RX has been stopped

 drivers/tty/serial/samsung_tty.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)


base-commit: 83f32c773255720a661aa45d83e36278135f23f5
prerequisite-patch-id: cfa1c1db9d23de3ae1cc6f0476a8ac611d09c7a8
-- 
2.34.1

