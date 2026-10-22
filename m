Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684656;
	b=r6EsYaIKLE4DSfCGCdmaVFCEKA8IGIBQBCSB3rPHdEnLU1P667aBo8nh7/zDSCqwomtc
	 eSzRPw07ZwxrjRbkGclLh11782+952UtTTvEAu6YGeFWZiLGDjRxr2deYlzjg5+aZGXeI
	 uDz2RSPAlHLs26GRN4v0PC4kACNYboV5mc/idzDoWC7fOx1XGNNdg/bb8qWgX5daNK0HP
	 Mnp07ZY12HA1UO4+YmTjd4QpQHYNv+q5eH4vHa3Dbe3qiVhXL0e/J64vfAVqjSVMOtICH
	 1RLB63gvfwEBsyrmsDNQsfd39pOoVUFnUFdKLWltDdGnhN5USFj2fgsQVUlMQcbsKGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
	b=m1tvB+wY5h8EyRO/I6Clc6kEwe8CNdv2AhHpoo6XF1yBX16WOU4j/nvMJe7I8NFEBnCd
	 AfmzytR7VIetO07IQUOHIU++1ma51KXvxqrL2a51qlLCTdZc/dveyOZHwL8ggYLMkQLLF
	 UG5DmtYlfKyDN2aWgmyoRsXE4IKL7bzh8Q53wElGI8SpuafGz2JYyzb1YtvG2zsXO+lyj
	 4MsoXa2Jv5zlsX0Ay4ZGU2umlIuKbJaHRELf836Lp5G4tFn21qxGq1KcYAvX1yEAYtC09
	 YNeTxekClFj9rCzVbm811EifjNplJ0GdC+inpz0OX68DkM/PxYQLd3oacV8weQlDDUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mopEgmah;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF594606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF594606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mopEgmah
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so13692265e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792684653; x=1793289453; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
        b=mopEgmahGi2LZ/MpaHEcX854qnec/UxPeuBg/hGh/Z9nqojzxFpELxS5fnOV7Ltg+9
         Gu+BuVPMR0i/9krCj8jdSbsiDRrbzaKK9/0x3Oh6BYf7feHfZLq9C/pypGvH48fJZQNS
         OoENBd9sWkdVdvP/6JYfb+eE8DWXUUVdJMnUm5YLcqYZ093zo6wW5TD8XhCyDUKicZAD
         wdO2+v0YRLJ3j4PWEOrXP8MJnwWGsaqquCM89EB0hjYjSodI1yeqMauHYpgy9nEeDDWv
         uPCsmw/luwwKeW3N7URKQ/DABaSPe9OHD4HGV0R7QRryY5gehPYFx5qxdbr8ZAoE7vx+
         QIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684653; x=1793289453;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
        b=kwlk4HrpY2o+GH1DPUxb30MOR7PdNDxKPUqH16iKWOntNqMukEkf0eIGGt6Vv8qgIX
         VLyQp+JB8HDVuAgrlxAIBoAhmYdk36f0YHYfmjUCAQdDw6LN57jNObHzCG/I0Awoaahe
         1WmPFjA/Rac3whYq4BhYeLMpyZaKe0TILvVzTOoADI8vLZtUrbvzQ+6Gm/XJeQaohzF+
         rpr5GpJMJ8DPnuBnp2wbtysDe+bqhckUIjI4DKZE4YZIRhqRLLrbzVLDqjc8uMCBtDsK
         ON4NBxn1v8fYyCH9SLrfUQZ2YMjyhrrogCsXHv213/wbbDFRUKDyt85G/TuPTu1OkJCe
         Rb4g==
X-Forwarded-Encrypted: i=1; AKwUvByJygDxdWs4bx97Q4l6BkgmyiFyODPoAizIL5BlJmos/yjwSDPXrFoNLj8wmJ0iDvz/VO/P6kI69IEf9Wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgmLmzJjJkzRNo+Q/10Pkz/rvWha7FZOPpZ9F6/mh8t5R338yQ
	z9sYTuzMA0Arsor2AKoCTt0mO9Rwvj4LIe8B0/YWgKuCcXvE93bUXsKYdiGehDxph0I=
X-Gm-Gg: AYBFou1rcCW0lnhci3BG4uJchU9szXoNM3pJK7TWlWIOSw7cQnpYiSnOixHHybAOFkZ
	lA7SkWhV0mkuiBZ81OwSQx3HIVAv14wRMGW5/Ovqzjf1e0gwU50J3feK/c7+4mirilTrzrbPCPq
	DsO6tCb2g1KqZp+mtNaBz+e1bvyikLCNw/04Js5vKEZCgcOdPrR5dXIOPvF2qTXsFkN8rzzbjU7
	/2C1q5vR4oN8D/F5oGmyporV/gQqjgcnHNOBXhqbeTFmVi0WYfQFUl3DTNs94joJFwT/0RxnZCZ
	vEIPvTB/d+Em6deO8Upi7rjJQpEfO7KECbjCDBH34b/26y8xu0tvTcPEUcpK0yE/RdE9EySotH1
	1cCBPhmgIsfd5YeOQRP7p3FxhSLst1szjB723snV/S+Q5sLSkcUrzewnEWLd3FIcAPjJOo3eUXc
	fXDqi4kh+1FxhAAxh4Dq4GifXEY3JvuAVTRzi1gAO3KsmGP2dEog1kVm8p9IyQHwP+nv8/VVvSU
	rZvFEPYIJMV5x8DCfPvfoiHJ6TcWqM3qUQkdGuM2YDNU+4StXpRjXgRBB8uGF57E9/E0B9rxH4E
	eD0NVyncZboWesCUkOduERAMHB/v
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr114281495e9.30.1792684652964;
        Thu, 22 Oct 2026 08:57:32 -0700 (PDT)
Received: from [127.0.0.1] (mob-83-225-32-96.net.vodafone.it. [83.225.32.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd360e4sm96519725e9.4.2026.10.22.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:57:32 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 17:57:26 +0200
Subject: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic Meson
 SoC CLOCK FRAMEWORK
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
Message-Id: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UAz2CBeRVzEdGJHbSwzqQild
 2+qiw/vbd5fwFiFDc7NAsofMXnnKu7QQBxCvjNKXx2oJe9aIpwnK8phxDFILnWshvH1xIFDv3O
 K5P0pHV3qAtTMpJzk+7u4XP9u8+3BsexdWNcN9iE8poQAAAA=
X-Change-ID: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
GXBB and Meson8 headers were the only clock headers, and only the A1
ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
and T7 clock controllers in include/dt-bindings/clock/ are not covered,
so ./scripts/get_maintainer.pl does not return this section for them.

Match every amlogic,* clock header, and the axg* and g12a* ones.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e5bda99b3015 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,7 +2555,9 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
-F:	include/dt-bindings/clock/amlogic,a1*
+F:	include/dt-bindings/clock/amlogic,*
+F:	include/dt-bindings/clock/axg*
+F:	include/dt-bindings/clock/g12a*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 

---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

