Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7E43F8DB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746043; cv=none; b=YwkUn5lcBdS7Ax7cgduSHK6bbbsus1siI9/3j9kqFtboxhgRplKMno/YL0PNYkd0nataI+ReV/roavYudr0PUwlYf17T/WBK3c1cxR+NuRU0fQu8F7lDAc2XC4TIN8ynsj26ejFnjMeWZxm5Ahmy4a8D9mx4ZKGvHGE7YYIqJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746043; c=relaxed/simple;
	bh=pGvPZxYQqsPDT0NieGlqMGA1j1B4VhkvXqUEbOfXDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwMsv3GSzBXRHoa8hF9Vb8Ky49+n2ZEdsmeyRaGe4p7Pk632KgsLBfaceHjvBABkWai5S9pl2bOEeM/fe1uBdshRuNwIHH6BpTXY08WEntf44ilBbIaCsMqxSg6rF5PxnNYVc7dqmlz90oVw4GIRtBLNcuj7SsjloHh9dYTMuec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmvMaMHp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmvMaMHp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c315729ad50so224426666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746040; x=1792350840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=dmvMaMHpa7cxE3HVuvq0zBD9K1Mx/5W5D/ZlsAXlNpS9rUmrEKSqV6kxvUO6ixNEgz
         oUm46/n+rK3cJeoQpMEKc8v3AD6MqZWlRaZlzI5+yItwrjHkoQ37l0XE8HUW+t6anm2+
         myqB4Mf+en7R/U3i/BRF9oc4xcYy5oLwRnoMX8rDioJItL42zzYHP4mSVY2/A/a+czK3
         yGysYKz64743GwaXfXrzQwgCEd+cztPdYaWWn4B03iTN/XFzzKNEJRM+kp+HTpoyZkQ7
         +CMwsTTcaK2ypSVnvQaerfViUuMK9i0fj+0NX7DGmcLPu/1vpTOsjXoNLMeb5etTFotu
         pg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746040; x=1792350840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=iytQyD/kuVDcsVADzeCj5iLK8NViSxlOiQPRzabd6ymgC8shoc9fChyDxXKMlh9uGB
         BlZm2vz6crF5Z7vgpRXJ7lC1fAuOInBTh/iGufo2QlHAnpoLECGgATPm8WJtSuPtFQN0
         e+AcPbz/tKLCk/kaAwk6LYkFiSidm5Dxi3QENfsQ56IeW8kbarAB3YIwN/Nx7d5ijBII
         J7FM9sJ41spJ3wYUyIzhy7cXSQnbPhfhvo++OfH7jjE1PDmwyyt/tDeE/l/Td1AF4cgX
         Hw4jljB34gz3yRyCK94Kj5HcmB10/Qi5CVgLLm39AnFANw4SyV33ldEci0+O//Nkfy0j
         PPFg==
X-Forwarded-Encrypted: i=1; AKwUvBwp3yoystt16SUTFgDS6KDWPLq/bNS28tJzGv0Td22shsEgBK/ecvUdPmelS/ubC/evACpF8bDY2DJSq2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiAGg59p2Iw4NzIernNYbRwjFfG0UjxGZuzV2NqIf/xt9GaEKi
	d20jr6ZU+Gm3mf06vHdE1kZf0yhwf/PnOzunhJrB+W3lg5ZYOR1R9NcAA8cHkg==
X-Gm-Gg: AYBFou3LsUfiIJdd7R25IlhbWd18nzB7CsEkk89GUq9tYwupwVlfxxEqx7OfzFl9zqm
	ZasLy5s4xCy5zrbLwWs/2niTw83d66rEhu7B7tOZvqnX5Pmox3XKJJxDO7Z9FR/B+xqz48vezR8
	KDzoYUEhsvssS9qz62W4SGtC6Um/co/JktJEzCsxhe9hBTgZ1yLuR2df1mErBGt0GNd9Rbj4tzm
	cJxcFg99yb+4TGZGumglA/sZGugCHR91ZlP4UL/WDegtmzOCeHdMMJ2qnQgcGOAf91ivedR1dnu
	ETqwYmbAWw5WFHx9K+47pEIL55ebGQCpSPL4fqcWdbipF/mvTBWE7Q5yQR5X4HHjweqZHlMsmMd
	5i86wp50O/Q79srnYxFUNijYSzOYVUd2vXtdujZkVSDefI+QqCo97mS8eiOOORvxsBFwSSQFH+D
	KWFtZg1BzRzke7T0fP/LjG7Q98VubrkG3AmJGHFA2d7cRwPBRwIu9sQAs8R6P04gjSmDYTdK2A1
	7Rg4d/lG1kLo8WLpdqOaUlc9FDQ2BSP1qJDBNGW
X-Received: by 2002:a17:907:9686:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c31aa017261mr838762066b.24.1791746039767;
        Sun, 11 Oct 2026 12:13:59 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:13:59 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 2/6] alpha: describe the Tsunami system machine check frame
Date: Sun, 11 Oct 2026 21:12:49 +0200
Message-ID: <20261011191344.981000-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the five system-specific quadwords in the SRM logout frame,
as documented in the AlphaServer ES40 Service Guide, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..fe3fd4570fac 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,11 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
 };
 
 
-- 
2.43.0

