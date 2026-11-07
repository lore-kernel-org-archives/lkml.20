Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011731;
	b=DdYAvjwnnn+/CrlX2a2xLJtqaxPSIZI7f9SlDKjcQA0WTc0+yd1HAzP1j2K15wF8xFOv
	 FDFHXWY0Piv6wGC0+tHq0OneRabLLyorW48zyn3rm/pV5deJj9Ihx/C01+Qyi0ixOnX+1
	 q0SRhuiA/NEmjpkdVR2o4pqCslAUEaRUL8Lh6lWM/zFxZvY6cAFG+wcRR9gXbvvph0tBL
	 xmB3MxDsCkqpfLr+CbskyUeGhJiIDlxTBM9ZC0ChCcx1PA0sq+QNdHVKJoz2oQZtNCcfO
	 XvpHo1KbJ8Pzu7pKFO41H7PVNDYbfkvnOhzC5qUBrnx1hH4uUJcFCl1wUTWKb0vnkDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011731;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
	b=CvrZeAISSAjsxc+/VqEosPLwiATLMRq+YtDR/O8+fRsoXHeRNI5qU+2zYDdXZ8fP88zE
	 gxc19RwS4B9xy3XAEEcQJ9VGrIAq+iX/eH1YO6Tocl9uCZ03qJlIXf2s6u39XcUczfh0x
	 N3y/75Vx/qA/BObMBk8dc8ntAa1jHAE4iRDXRHTmwkWz+Es9j9kuNEd7Y8v1VNf5COmtO
	 e8e6Iil8ZzEJbtahWakrSdkQo00Tg3uwD+NsyS0Efjj05sMFCqEdTd/rpJtjF3YoBNmsC
	 BYPQBdABkfaR6qMlaTXbWCgcQ6wGYiWW7VaeWIaL/aI1l/qCJ6dTCItzsl0pHzty7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+nRxm2C;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Exm4AlYm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFD606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EEFD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+nRxm2C;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Exm4AlYm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
	b=L+nRxm2CdsZjDDLfOiM3rw6JQ2YSkFMIvrmpYPMZjS84C3zqbxjW61Ov4CHinq/8Z9Ed7F
	p7lG9WubYfUP83O+uFRnNVIki9rHguw5OoMUUOdBRpt/ZEwMBQEEHnj3Jdjq/4hm5x8Lnz
	scGozOfaPzmDEO9fZV6zsNhh4r3/6/Y=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-GWp4P69nNGGPuImznR0JcQ-1; Fri, 06 Nov 2026 19:35:28 -0500
X-MC-Unique: GWp4P69nNGGPuImznR0JcQ-1
X-Mimecast-MFC-AGG-ID: GWp4P69nNGGPuImznR0JcQ_1794011728
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e89171fabso21373496d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011728; x=1794616528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
        b=Exm4AlYmuHbd8sGxG8TGS2gsdPsAltBSXAI/mxfKHuusHm0GrNdorHi4h2bo/S7ce3
         XxIOc4uHWeaxREHTI9At9kvm7lNqBC8HiYgUSALvuF4Qm/GUk7woA/lZVPxro2wZlD9E
         I8govdx8ZdhLiN5zRaJvfsuJHODsDVELU78Aa+wFjgGhZAO/D6O+ri0p8zqk5B/9Qtu0
         Ty6wRDu5EvFGB5x4AeaCYn9UubHBgwbElk19OkzqP5xXgXSDCwMD8aQedtUjXxhdxrMa
         qFIPVyViyXYyBqUlJNew8egUhG9u/atPlXyYXdz8IO63en2EOPBo+UV9HzQ1SG30hvym
         o6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011728; x=1794616528;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wkkOMBuq2ItsU8Of8/1kEShV8WBIjZESY/FvrDbCiaY=;
        b=n1eZhvh+gEFc5iSpqY9coQQqK20+ZoDGtTpixNlZlpSRuqFyQrUfdlfHr+GD7ifjWZ
         1ZMzzNsJXuYG7Ghno0Q4Q+T0H1uQIpoBMeDocp0l0SvF/gS60gO1pBzQhZwB+3TFG2Rg
         1IVGDRFB7ePaofzXdQd26RuMaTBK3ixXbQj2LGweUk0v0B6EFhuzdd6/YlvCbh7p99f6
         HPq/VGs1naK4vdWsqTQ9hU3Uid6dSZhaeuvCDmh7VwvSfwchSD0uEBR33z+qF+ObNWX2
         xBTuJHiBWdrw8FiTlLN1XyhbVXKvxqQu2pgTaqLcXhIbVwflhEUIS6Z/1lf1FvpjuCVr
         xfaA==
X-Forwarded-Encrypted: i=1; AL+hErGTtXfKqlYwC36z8Wv+4uqdqDGc1x4VYiSI4awAUuZNP5a/sIQkOL+3wb6TyJGnwpaXYDiMmDL+iSZB4L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xQfhnqL56sxr+OqhFsoFzPxWAq/faNPZWTHt+PuyOb3GXtTo7
	yqd0OzR0KU1x2c82+9IgqU9piWpHHmjqgjTMG+Tlkdl3PVrbORittG3AjUlNiu/MXkDX0avmOYy
	uAF/K3t1UrBed+X92Z9Vlhxw6D7wGbudvYKHiOevfOh7awBDhitHy3A9a/kTJJyy5W8mSu3jw8L
	NR
X-Gm-Gg: AYBFou2Ivcwu8dgwhWNpuaD1bQGv4UpmT9K6cIWKXz+cxQv44DgrRw7Zw5NQmfRXcH0
	AvZHJR6f9cLoFbFkAAGSusTzVQkCeHmy01bmC/tybxG1Cf4/Abu6cfCh6YhjIpQyAcTw45S7vEj
	w2+8fJVU26MVbLuyGDlCDTSy9P+y/bm3eexE7D4E34UxyIyU5n1Y9u/4na/80c/+1Z6XJrgmw8m
	5WXwAh7q0a1mK2opHsQXoSOb8I47uBX94Mv5Tj7s2Sh7PosufZsu08gvfMXWXi4AcUMgCvGlxYz
	sR/pCPpPZ3bWyN1jJ3PAnEhPzMJeJl78+CWGtInEERVEKQd7Nl11bbkd2P7QNto7zsEfLFzriVz
	1LLV6KxQTq1KKgwhMGjjm1wBti7cI+qNI6BPYpWqku9fYmE2xsLEgfHmo2Xr/AJCikb1WqxWFl8
	hJLkqRfeVYKQvMrOCD
X-Received: by 2002:a05:6214:21e7:b0:917:942d:f597 with SMTP id 6a1803df08f44-91ea96216c5mr59222906d6.12.1794011727881;
        Fri, 06 Nov 2026 16:35:27 -0800 (PST)
X-Received: by 2002:a05:6214:21e7:b0:917:942d:f597 with SMTP id 6a1803df08f44-91ea96216c5mr59222696d6.12.1794011727405;
        Fri, 06 Nov 2026 16:35:27 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] usb: phy: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:35:11 -0500
Message-Id: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4as0s9ZEpWnKVcRCdTAWJR2EiLsrl
 l/y3n8BYyRkqMQFEXdimkOCygR0YxsGlOSTocgLo1Ru5MZO8ub4ZGl7rZwvtdGthXRYIvZ0fLG
 6+Z2WE3brW4D7fgAvZvcJbgAAAA==
X-Change-ID: 20261106-usb-subsys-8f41bd9464a8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=841; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=yk6LNvtf3ULASyxI6ekyKd4jXFpRSV0rSCDucsgDTMo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFbneffKraLkc+7J7nlxnMnprHt9xk5tiNol38oJoP
 dEVPB5BHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyExZGR4eC06os6xpOnzpsk
 lqP59KyrhtFDQxvrfU9W6q/SPrToUSYjQ/vXMCutO7+7uRb9qjC8OFls+kSD4Jt2LBUHCvfInw+
 8yAsA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      usb: phy: generic: convert to subsys_platform_driver()
      usb: phy: phy-ab8500-usb: convert to subsys_platform_driver()
      usb: phy: twl6030: convert to subsys_platform_driver()

 drivers/usb/phy/phy-ab8500-usb.c  | 12 +-----------
 drivers/usb/phy/phy-generic.c     | 12 +-----------
 drivers/usb/phy/phy-twl6030-usb.c | 12 +-----------
 3 files changed, 3 insertions(+), 33 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-usb-subsys-8f41bd9464a8

Best regards,
--  
Brian Masney <bmasney@redhat.com>

