Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB22620DE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943830; cv=none; b=qumDwYftUxmx8B6Of0mWZ/5rcPOFo13Cj9q3V/5gGhfUCLA0YS8UrX62sGMOlsWbVGRDqR0U5PAHBuAVJ+KsBrAowYRQcdWoBrDlOVnZNaSQX3UfOL4CflD2MEA8aaviPNs4kukuu9CouOVAGRbDS7FUcYlA+aTQjCsM/+mW7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943830; c=relaxed/simple;
	bh=QUP/mWiQ9hNu1zpYzlxuN/F+0PRmerw0BsOtOWyPgd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6KK+hZZ9r3V9gaJrzOATfNO+SRAM+67SVhTt5yOj8+t9Vfrt0Vw/XiN6XhaTmzvdJzMvuOfcmgmeCgTiV8zDz9x9807i4ob79SXR6i0DbYm/+4mFzzrp4yY48QLeHnjS1TfUcpDkHp38TpvnP0K1gaI/mfZ4vOuAkzxFCvAXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhqOnzPu; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhqOnzPu"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67489c8202cso2827917d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791943828; x=1792548628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUP/mWiQ9hNu1zpYzlxuN/F+0PRmerw0BsOtOWyPgd4=;
        b=bhqOnzPuRDKSxvNXa7ZNYePh/m3rTHmz+P5T/Jxi8eGMhPbU7Uzk4T1Vb7A2Du2F/k
         JfjBUR2S3w4DUaHiUs18heW/2HJpQ2hPjRGmIOBkd6ixG1BIJhag/X+fVqRx//IbGvhm
         6bOQ7EMF82SOcD0y/ZyF17HGx7qp8jj/hLXr4BrMV8B/DEJSCFWrKFSHcxQGvDWKr8vz
         nU8Qa1EVQkK/g4nxumqK2Modmz8Bq0MKtNaQQZEIPdC847oE50q/MNlgrTdwUT67zAjP
         UWKJMfH5nfks1nTQjsomii0IZ4d2Tu793CLQoQ84drOkzRIfaby+l3XN2/GPl3a+F2mK
         pSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791943828; x=1792548628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUP/mWiQ9hNu1zpYzlxuN/F+0PRmerw0BsOtOWyPgd4=;
        b=SOekLrzNju1P6yN+dsYB1QumJF4NxdQoA4fqpULYpXzHLgHVkJxaCPkxmyYGPZTEvs
         J1d30dclKmHQrZUcckxG4WPCKY47PnGX9ggYmA+NavOJm6cBmsAVHiS/hkYnn11PH/qT
         FbOSt6PSBJuyE9hNJ8CueUSBB6eamHvmkc6FaEN6gL3IIEzlO4TwT81+DG7Ow5Yag2gZ
         LhZBplgURV0SEKDlvMgW6cC5kLi9EyJ8Oa71L0vNkXStJt/iYj9x7Lc5iM4kR5syipud
         BR3xc7kMe6zq4lJ3LMcRzctyl2RnAMcJgLcYsyH6dTqIyKYyXeKMk+fNxp8Zee/CzxUb
         8XQQ==
X-Forwarded-Encrypted: i=1; AKwUvByaqPZTml1/83WyJpjzeLkDusOiK0GrbqjrrKh5L3LEQLqhEQnz6jBJbYoTPtzOZ3tEm7cYlB4MEtvfCKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9FMUQLJ8Qbe+ddQtiiJ2hqs5P8YhqW6SnOW2BN3W4brC4nnQX
	0JjoQ4QKXXvTueJ3FAFkHHAQqZm331fzhHflfMxgDi8KSBYAtTsvh737
X-Gm-Gg: AYBFou2WpTBvb3V/CRmRPyiaAg2yX3csQxIAkPcOnyfdiVi710JkxX2Kk5PdPl7AMuC
	Y1QXx6Yjy0yROJbJ9stmNibKCHyfeDRSyque8YHKWbiSPnHnly/jFYluV2vNfvtUryirT4Vi2Qu
	qrenbP5wnIlI3b89APdgTHU8R1z3HECv36yk5iV3YG4HFZRLNGL4Nmt8RcfXBykAeeWN71w9u57
	wpsFA2bcOVCU7orQTTJeXpD04LjVlNipU5Ld226CiyZB4wSij7/OeZxjyrIq4Sg9QBt7T/ODhXN
	dPMUXwKMbdJI+xSGjrQeSDKrmZNup7iVX01QVtzr1P0gmEfHQwiioLMGT21TgzSL7/jM9nM0CGN
	vK05oAm3+XYXwdMrrLyK2ZRQOspHSVzArO0/iKgjENM1p3CNkYiTOCID7pRbM9uyDUR/Igz5VXc
	a95vLZkeVBAry1Ahd/vviCjQHOILm72gizIEtyPyViiZdNyO0erIV6N66TgODJDHFfjtA6DKZQn
	/Swk+BmvqsP1FYt/CoiCZwEMERJjprN
X-Received: by 2002:a05:690c:4392:b0:8a8:8d90:a673 with SMTP id 00721157ae682-8b07ee2661amr43935727b3.26.1791943828007;
        Tue, 13 Oct 2026 19:10:28 -0700 (PDT)
Received: from localhost ([2600:1702:d60:1bc0::46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f21bc65sm51338527b3.26.2026.10.13.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:10:26 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: Re: [PATCH v7 0/5] alpha: improve Tsunami machine check reporting
Date: Tue, 13 Oct 2026 22:10:18 -0400
Message-ID: <20261014021020.3842132-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 23:15 +0200, Magnus Lindholm wrote:
> This series adds Tsunami/Typhoon system-error diagnostics and Clipper
> ES40 environmental reporting.

I rebuilt 4 and 5 (1-3 are unchanged): vmlinux, W=1, for GENERIC,
DP264, SHARK and EIGER, plus DP264 without CONFIG_VERBOSE_MCHECK. No
warnings in the touched files. Minimal configs, not booted.

I also went through the 21272 HRM and the ES40 Service Guide this
time. The PERROR and MISC decoding, the frame layouts and the Clipper
bit tables all match.

You were right about SERR, the note in 8.8.2.6 is unconditional. And
8.8.2.1 says configuration reads never set NDS, so my probing question
goes away.

Comments on 4 and 5 in reply to those patches.
