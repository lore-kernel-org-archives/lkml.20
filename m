Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=94.100.134.218
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794122609;
	b=Kc0XQsEgpB1s/zsFlg2ttgoMIuAEeydupFkfhtgDhFT9JgttcqN1T8abB41zvpEBr3uE
	 7r5w6/UCCVRqg9gAGSRUYMfL48gUYNUJDDP1/kH3aiMHNxHdN/ysoBFdfRUAZvk2o+D0S
	 1Q5PJYY2+SKOmtU19bZB3vzRBiVN/3mcpYrYCr8swF0RH0XrVCRwlu2px1Ce/ni6D0NyM
	 0oRJ8lL05knKRGZTRcO3MZOnRM/n/WCNjkXxyTIK+AV/EJhgKdsOhuJN48fxpqZOEvIwQ
	 b5KF9tqTct1/OhkwVtBgkzrmYBU/sAmbu6lOIm8oUFuYQVlyr9fVsR1AdwvM+S7eTDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-cloud-security-sender:
	 X-cloud-security-recipient:X-cloud-security-Mailarchiv:
	 X-cloud-security-Mailarchivtype:X-cloud-security-Virusscan:
	 X-cloud-security-disclaimer:X-cloud-security-connect:
	 X-cloud-security-Digest:X-cloud-security:DKIM-Signature;
	bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=;
	b=e2frmmBHwCIWphBjNXlHjlqcaJu272ReiskyobSN9viOhw6MZnTCNGGAjKmUg6o/+1nU
	 HV7j4Np1CablyxVD6D3iZFq1ILbBRdI009suPlsCbmff8DO6FKa/1xzkCLt5Xqe17oM1f
	 pHhDyxygshIvtHEZfq+ihKXLLHH2ZZEKZD7YuqaRtna1GJk4KxpiQp+brCFQ6ePwUw+kB
	 cXadK/+gbjF73FRvDYhN1hCbFFpO7xDEGoLbvegem6IGkons01jjbI7v7eDlAof595vpU
	 0v5ZNJzcH8KjqsCrc4Y1w0ZFmPJRF+Byt1904oo2gTXKF0ekvqfZqiIBk6Vhk48j4jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marcant.net;
	spf=pass smtp.mailfrom=marcant.net;
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b="MyXo/99D";
	dkim=pass header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=ZshCi1Ds;
	arc=fail smtp.remote-ip=94.100.134.218
Received: from mx-relay48-hz3-if1.hornetsecurity.com (mx-relay48-hz3-if1.hornetsecurity.com [94.100.134.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A7606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marcant.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcant.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=gandalf header.b=MyXo/99D;
	dkim=pass (2048-bit key, unprotected) header.d=marcant.net header.i=@marcant.net header.a=rsa-sha256 header.s=hse1 header.b=ZshCi1Ds
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=1; s=hse1;
 t=1794122596;
 b=baNme17xd6JWaQguWhmcXrlh4jfNnYhWREjhtifiq/Nq4n4dHAIRY1Yv/V6VTCHpl7DoyNz4
 6GmbmauzJ57pQxWiXD0L5c0buUQCRihUNPUF6VqvWkvQfY4BZPkQ14fHg03IzZW4dOI6GOFkxDZ
 Co/A4ODjCFnpvyjiGfc9lAnk280g/p1/DC0trNrmt2uweAeEgQ/rKNm8vR6Oyu6hk03u3bPh0hH
 pVtPuuDrgmn2U7VLMHTcb+cojbtGCziMVv9Wb/TNexatoX4TUvOJAwcVeR17wOKKYeImZj3J2ID
 24VzW5kd9iRmb7VUG4mhEVuZDQ8W4UKJDTrf2Tm5SHIXQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1794122596;
 b=aqGDLRvbYDX9RCFECVn/FY1pD8pvd4yLMdMMicUi8OZuHCaSUce2DlKnsbqzCBBb3r8XNcP8
 dwzlNXwoSClqTOlY7MXpxzGC5uPoTD68hKcFLVHU5+ZhdFdbD/AwZuXllcYMeyByxyzYn+0xW4+
 lTllra+bc6Q6Mf1L5kXk0bTchEyTK/1KUclKr6uGd/R0eb9Ntffdp5ZBj5GJ6lBQUceA76/LAaU
 ct+XuS5jrVYqNJ9Yf1JcU5+0zOKyxcik3+EPRop2z/7Ox/kro84LHhZuDp0w45PalfMtSz2/RLT
 VlEI5CAwz9k8/CS9bpjjwiSbTeMo2K2qioSAm5ZXkW9KA==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate48-hz3;
 Sun, 08 Nov 2026 08:23:16 +0100
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id A9FA9960126;
	Sun,  8 Nov 2026 08:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1794122582;
	bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=;
	h=From:To:Cc:Subject:Date:From;
	b=MyXo/99DbB+xo4d6YWFSTX/VnPG1er9ywKlnexkEgUv2UwKgM5mqpuTCGEq77FHfJ
	 YGbxXyuJba3jYXEpcRRx5OdEE/jt5wp3A0EUIbiu/czmbfXrhWKwd76kYNLETrkJ9P
	 +zmqNfmq1dsPArw4BMkEet/w4toWsAY4dNnvhfr0=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
Subject: [PATCH 0/2] clk: qcom: ipq6018/ipq8074: keep port 5 on uniphy1 at SGMII rates
Date: Sun,  8 Nov 2026 08:23:00 +0100
Message-ID: <20261108072302.2311227-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
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
X-cloud-security-sender:avalentin@marcant.net
X-cloud-security-recipient:linux-kernel@vger.kernel.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz3 with 4jMksM0nFzz1kNbgM
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest:33fdc7937bbbd520f6405a31ea0f80f1
X-cloud-security:scantime:1.473
DKIM-Signature: a=rsa-sha256;
 bh=GzELP9N6NjgWMoOc3csfVnuCmbbLp2kJQPAtwx4eXT4=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1794122595; v=1;
 b=ZshCi1DsYNjFgj6fC78tUeULq3pD4vX7M3oThUFzzADo90WZD7qww0r7/eWU614/x6p6yCje
 OUXNaUBzuOmsktvMsssiTh3F2UNATbD511ITpReABuLkm479SyeVX7dxyE1+XbHgrheHPFZ3tGH
 t1IA48jxleHBxnT47dqtmfcOwbAWIjh+jTUJqGpOCweVvZLbZQprLBpuKnYHZaEa4y+4mL92Ve9
 dVhW3nTSeMcjUc75pba99Ne7p8vedT6PMnxdGKIleeozHTLFr89aFCVVz6fNJ5LJ2wsoszJoKX0
 FOtXvjoa73yHvRwKgWwfa7y5Phs1q3Sgg9l+hgG2DRyCQ==

On IPQ6018 and IPQ8074, port 5 can be clocked from uniphy1. Its RX and TX
frequency tables offer uniphy1 only for uniphy1 at 312.5 MHz (2500BASE-X).
In SGMII uniphy1 runs at 125 MHz, and a 1G or 100M rate that reaches the
RCG then picks uniphy0, or stays on uniphy1 with the wrong divider. These
two patches add uniphy1 / 1 and uniphy1 / 5, which the port 6 tables of
gcc-ipq8074 already have for uniphy2.

This came out of a review of an OpenWrt fix for QCA8081 egress corruption
on port 5, where the port RCGs were left on the RX clock by the
bootloader [1]. In the sequence I can reproduce there, the rate change
stops at the divider and the RCG keeps its parent, so these entries are
not exercised. They matter wherever a 1G or 100M rate does reach the RCG.

Tested on IPQ6010 (MikroTik Chateau 5G R17 ax, QCA8081 on port 5) with
6.18.55 plus the OpenWrt patches: after link-ups at 2.5G, 1G and 100M both
port 5 RCGs stay on uniphy1 (CFG 0x300) and pass traffic at line rate,
without errors on the port. The IPQ8074 change is build-tested only.

[1] https://github.com/openwrt/openwrt/pull/24566

André Valentin (2):
  clk: qcom: gcc-ipq6018: keep port 5 on uniphy1 at SGMII rates
  clk: qcom: gcc-ipq8074: keep port 5 on uniphy1 at SGMII rates

 drivers/clk/qcom/gcc-ipq6018.c | 4 ++++
 drivers/clk/qcom/gcc-ipq8074.c | 4 ++++
 2 files changed, 8 insertions(+)


base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.47.3

