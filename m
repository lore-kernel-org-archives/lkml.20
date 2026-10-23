Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745966;
	b=w1/ey80zJS/mbJNTOT/sWDJbWMV6s2/+UuPClTelUk1IDsOWBQ+YNHEtXWDnABHusSsN
	 aGHlw/tevdVzqIfnv9B9MPqiMji4gj6kRAah+z/XVYaMxPjk9CibBtUB7Up8Bf26WDu8R
	 StZN6QJ0EhLx3Oc/cd4ZAqwX+veoCg7RNFfpihMQl0glzzHh4HqeO6m0o829AeqzxLVSL
	 jjXb6iJj7uvuUj5yjl0f1AOG436OXiEL/KMMx5BRcyvAvSINLj0lt6uki/x1Gd+9IR1w4
	 T8PBUwNCxzQ9qmXDRdSpwO+BcRSgEBvIAY1ayChYTlHoOvYkfU4zzQkMF3RQdKHscPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745966;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wZJSrGh5IrBV1BhaJc5SqNrsz7GIeqILa01fxlOsORI=;
	b=ptEZhP6VPQK9IDJtfbrdP7xvf1ZJVvbKk75gcxHGEpO8FGgSk8rDdNEb+JWu5Q9vtYBT
	 hVyuW6g71tJ6aSWq5sYeXizDLkeqT5jg5FbhMStDh9QgLjylSWS5fe0ZeUJaMtFz/hN1O
	 9wRbpQQtrsiQmqWaDAQZco21kmVoqv1VAuLaawhGvLbQXyTL48v6kTz+cq3IzG6MXgzxc
	 33h9UcyV2Pazbmrv03g2Dj8QkmJQ/MKvFh0c+kRk2IShfxDRsovhc/3Tf7vMTP7yU0tEk
	 fmFbgnjdHotHgFpupcEU0ILYiMygTYGmANLHg5MElVLdFakbkZy9CyohgPWPu0Es2iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=oiXkSJZ6;
	arc=none smtp.remote-ip=95.215.58.224
Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60975606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60975606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=oiXkSJZ6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dV05KDDCuF55jc1yT+6VA3kaUgOJOa/iajAzfoD/ImY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792745963; v=1; x=1793350763;
 b=oiXkSJZ6+2FCHxMUmpOe+6DDKvtIQwfBRMbqvhhwqAbE1s6fds5RUMaJy54NjBCvtZaVmRoG
 JCDXWoXzRtGJyzli3kFWuiscXHp3Khp5nN5GRZwbVAWibc4NRGWuqspKp/YVarbDgAQxm1YfjoS
 qG6yUd96gWWO3CeCQhXjKTmzPUFnMu+P1uYtC1ZYBl1YJaj+5bv6MsvFaGwtNgmF1iK+Jxt49hc
 ekfowYVRjxOLxakxVkiRTWyjO9Oo6YwbsTclf6pDut06yej2u+KnvXZ8PwGxCHngaAb56a+pzh+
 A1W05VukjwvDSUdcjLlj+rKdWhGRtuv7JHVwH8h9yLw7A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c1826811f3c4f44d;
	Fri, 23 Oct 2026 08:59:23 +0000
X-Mizu-Trace-ID: c1826811f3c4f44d
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template
Date: Fri, 23 Oct 2026 16:58:36 +0800
Message-ID: <8cdaa5708b92e35cc2d704a8c90d1a27fa842819.1792745468.git.wy@wyuan.org>
X-Mailer: git-send-email 2.56.0.379.gc618271300
In-Reply-To: <cover.1792745468.git.wy@wyuan.org>
References: <cover.1792745468.git.wy@wyuan.org>
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

The credits of the contributors are saved in the commit logs, thus we
don't need to repeat these names in the main text.

Remove the Translator template so that we will not sprinkle our names
throughout the source for every change we make later.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Weijie Yuan <wy@wyuan.org>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
---
 Documentation/translations/zh_CN/how-to.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1e76..d448ae69e48c 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -203,10 +203,6 @@ Git 和邮箱配置
 
 	:Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
 
-	:翻译:
-
-	 司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
-
 翻译技巧
 --------
 
-- 
2.56.0.379.gc618271300

