Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A40C3F2118
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857620; cv=none; b=aaUunAzF6hRTrYREHREjLdIOfvDogFjGGR5vf/HTexA2GC3SMRGxsCI/wiZZ0YWGrYv2u7p0i4UqlZSa1l0cHSVgyQzzTMdIoPmBUNvWXAo4oxEz1lHORgIRXf9+yw0h+sNlZomaXhr8QEo+5Nm7p/VZkeqhbmizq9+2IRvH6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857620; c=relaxed/simple;
	bh=pzJEecE88unv5hwvpYlWQPdf7Vo4wY8J4FgxcB/2nvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGcy6UBznso9T+Qddi9P/tLLDr8pppi/EhFL2SgK3wW/jHV6Ksg5NNJ++ufIZfla9MZr9YCf/EpYZ3771y3P1HLWpj/coszov+DiWdzqKerl29Zdu3X0Nk5/qzhYttjOI9BU1dLiKRB+yacKfQBSiVOheJ4dLyhtdZwOTyvQdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ2QQ6yT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ2QQ6yT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso167165f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787857616; x=1788462416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ye/9ulKBaC7alnS77GSpaMa7bLzaEniiM9r+DAjS4/o=;
        b=cJ2QQ6yT7HN0Icpr2XOW9cAcXLkyEWtZTvJb8XGtmAmcUbq0CgiT3iFQRlUJB6+LHK
         zXGvRoY4Hi81I1o/eujkj85md8dtiGwp/yl4qm0EEwgggriioRnkEmidpM5N4s1g85XL
         ZVwvHAnbLYSaH/EqCxM8TKoW44t2Fir+NqfOawJaAMrVfqrLzKG5C+w9FGq+7FJv1aOB
         kYFc4iVqQgJU3xYPchySVTWRMrplUEWNyqxYJcpg/GEmOohvKK3jCI73Cec9ECxxVVQo
         JqX/ibPXh7X5qqb106kdsXOGMGoVuMR9kcjLXxywGDYn5XyIHOsdwgpBwvkKwI20Ljp1
         FU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787857616; x=1788462416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ye/9ulKBaC7alnS77GSpaMa7bLzaEniiM9r+DAjS4/o=;
        b=oyLTDk1medhjL7AonafQo+K2ijXEl8EoTDYRgfP4pNv//5eJmgyB5JWc+bEv+Wjpzt
         34Qe0GyhUN5JDXBxgZ23y5Je6cS3t2Xy/yGzvmqZiGz5XN+ZfE46U8hUs2stOSocDBhv
         XHlD8xqwhnxotMemfK8MjVIPYzOSd5dJDgnl7uIfAoidvAHBpcBnRN89VJJ7zwHIczie
         LhP4Xu6QSIehOSrbwbvm37Gu28bfooq142jXj9v9nbccmc5K2lfBFsE/I5ANI4WPPs3P
         PZ9qNc75tESboRNrrKD1ojGHU3AD3sLh7zvi6Y87UlqOeCafCJscIA9PFi/eYSET1DLO
         IrYg==
X-Forwarded-Encrypted: i=1; AHgh+RpA2eEEhPRXtIFb0AclZX9dw0kNT+M/rku4V+e6i9a4TVBp0xSRuk8yvS+axOCrGQxF8cs3diSfhuSyvbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n89nU+C1xpk7+Fk8dX47ho7t+YNuCrcQGCtVpS7c040GC1n8Ze
	YflBAvJjTzSFR3upbBvF+zOP0gg0U9eMzeyfOzgl9oeRCW2/F7YVoPON
X-Gm-Gg: AR+sD100Xg0ygYvKzMyorB1bfE+2PMfygOV8UkQCnnVUbNh0sz0jvi7fguOgyWSD/aA
	RtZAlNAWITdNwl75QvnbSHIaPz4GVseMqqjyrym3CYZhLqtJSIiRXnDm3thvAwnEd28c0hqEgQD
	NQgfwupCVoskPFswkZuUm/k5fpcogNddSohNNeVJ1YlFKw8Ahm6RYsij+Yx/P+AujEFmUL6ZAor
	17+VofQK7mALXt7Sm447gGqPgxeJpyBVHHY6i3P1OpQ1mxWWvBIJPRPQtEwnQa7maNijPsQMMX6
	Q1iymAU0ZCTQybLvEC8t22d1do+NsPMdNtmr3++05+BQQNGlb8P8ILwtqnFYRUVo4hQ8V/musEx
	nqg9Du8Y8RPOdNEN1Ic9axAxXSUQ9lHCJjGNWm/LdCcxG17HJ64HKKf7w4pE3EUJ9sclG/0b/8j
	+Qhmk3jMrAzFz4xKzUck7dEHf01eTYC+qgIxEvDZRVKFHb51kYD5IeAMJ/qBq4xKxnyDq7Jfc9p
	jMnnSyhUg==
X-Received: by 2002:adf:e00f:0:10b0:482:a9d7:7ced with SMTP id ffacd0b85a97d-482f79b2420mr1034763f8f.14.1787857616265;
        Thu, 27 Aug 2026 12:06:56 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c90:ce5e:8e8e:8023:a4fb:572e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e2756112sm11992439f8f.0.2026.08.27.12.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 12:06:55 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: George Moussalem <george.moussalem@outlook.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] Enable USB3 for Qualcomm IPQ5018
Date: Thu, 27 Aug 2026 21:06:47 +0200
Message-ID: <20260827190647.807193-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested this revision on IPQ5018 hardware - a TP-Link Archer AX55 v1,
backported onto 6.18.44. Both radios on this board are on AHB and PCIe
is unused, so nothing else contends for the SS PHY; the combo driver is
exercised purely on its USB3 side here.

Two USB 3.2 gen 1 sticks, all enumerating SuperSpeed (speed=5000,
version=3.20, 5000M in lsusb -t):

  - hot-plug, both sticks;
  - warm reboot with the stick inserted - SuperSpeed 0.8 s after xHCI
    registers;
  - cold power-on with the stick inserted - same, no fall back to
    480M;
  - 130 MB/s sustained over a 3 GB raw read, unchanged from the
    previous revision on the same stick;
  - no USB or xHCI error in dmesg across the whole run.

I also exercised the vdd-supply path that patch 12 adds to the RDP432-C2,
since enable/disable sits in phy_init/phy_shutdown and that is the code
this revision rewrites: unbinding dwc3-qcom drops the port's 5 V rail and
the device disappears, re-binding brings it back at SuperSpeed 1.8 s
later. Works on this board too.

I do not have an IPQ5332, so the combo PHY's PCIe side and the 5332
instance are untested by me.

Tested-by: Stanislaw Pal <kuncy7@gmail.com>
