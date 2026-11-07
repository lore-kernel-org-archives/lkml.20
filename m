Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044539;
	b=F5v8pA3ptVrpiRrxhh1HiXJ4L/WEZuP9Qrq8J+Re1iGihnD0ZTvdUsQg60zf3X01sSgh
	 3pKBieN5JGGo5zIe4e8t2KIcUEdkL4p4QyQ1LiTNn72+9tnYK98+EiAWrP3zXszJBe7QP
	 Tuw4ZJaebztgKWA1dWRCM/akRbGxmKBOX7GhyB5Utn64gkzeNmBzIENBgZK87TsF491Ur
	 9Pom4/u5Qj++9pSy9VT8+CsUgFZbexy0Z5iOHdeiUZVUZ2shGgWU7qbrC+38VdNARk2oR
	 E5KtVKjx/OgSlOHjCvrXKvB4LYtP5AGuaqRhQVHglYvHVGW2TNp3QgkHykO4E70M6+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=S+7KDE+6rrMCHsjKljUeH7H7PbgkQcFLRNYn0GcKaMwBa6nJVs3ohitq4j7kcWEnrvAn
	 NoqN/OT8QRjMaG09e7qKHxIYPG538AzJz4TMs1A/vFonwfNR6/pm+5CJaKCEFA1nMLzTY
	 Tnb7qfJNzJI/+K7VmtTs3MlSVMia7/G3lSxFoqD1ZhM2YMoSEJzXKa/XBY5h7lnU0HKyj
	 dk7goTVarPV+lKH95w2qMJMenIsNIC49uUc37IA0jVkTvkNDzrdPLMaEs7wBEKN3kO3LY
	 87NhHxecoLWbibEfn+vMdMez0WMFxFBCI0vSVQOsrQRjHdvmsrWMCS0nXm8DN0fqn0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PTRW/zf3";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E309B606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E309B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTRW/zf3
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2351682eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044538; x=1794649338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=PTRW/zf39QqYqtZSHb2mq3WtdfFKv1KzP5l3RCelUvIIec//xJacm7JjY4gW+N/fMW
         AQwI3FC2vXQXhTvRrVzfKBDQ812xRGCXASd2isLacrn8ocFsO5pTqZQHRJO9IZnsZcsu
         ncTkq7L76dQ2putQaFxt/eseUGztTDwdbum0U6S9AzqlYY5sVQk7Ev4XV+zzY8q2B1EC
         71a8PrSc5lVQhUwadeus7Y8pUTbQqZDC16HCmYdkQ7gyLNOqEvYIfibhFesIPI6QOPuM
         x4jQBdzaYLgKsUWkzIZ/1GoDElLUkxRq+ffdf6yG/v9EIERo7pXlkjqDyik/5q8GljHw
         GrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044538; x=1794649338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=MNEf0f3IHVAECmMVRZIFJS2p2lBIE+wc64t1esDcYWpp9VRIvDghDgLKFlZYPSVKvz
         5Sra1fX0gu4Z2Tgg8TiqpQHFpRHMI11w7URYhbx+jk1tL5YbWf02WJkJPGEPAuta15TJ
         LQDD14KkXdLUaVQhZc6LzinJTxyy20g1xT1kBRZBwb/C62fx9K20IycF+Tb+JzoplG8X
         yLyAQDGxvHzSqAkzP742aCSxyJ1SyzO4zqslTmfS54y3xqt9ICW7cWBoXR4JjQmiLIRD
         6tYAVLxVSVgjkSRw4WME6y3lxh347OdoLrd1Dd+BcfeGurY1K4Ugut66iXStg0WVNDuq
         ouzA==
X-Forwarded-Encrypted: i=1; AKwUvBx6K+hnyhfRqwky98GsXKIBamOxqVRZcEx9Ch4ybwpi1NeaZ+9euK0gcqfAf/wKfAcSu4zmZp773SZ4S4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hZ7rTQYdZxPnv+3i4LQ4gnty0N2tKnf1BiJsvz3dbVrpU0mQH
	pvsXun+Jv2UbcKGif+K9rJWBnvoffOhusn3fdvSSR8BvDQly+7JtNF8W
X-Gm-Gg: AYBFou1Wt35MKzlZOCivbfUrC0it+NLq9o3uEVBWP1IjJLTHftcnSb2IChYscHxEMqR
	4p0DUT/6yTfzlzKWZl2TOKzJyzKFVa5e/B+BLa5sqXll/lilXwU1iHHv/OY0klkRTdK6LjZWoQJ
	rf7w47RLKRLRG1BptU4aX0ihjKgYmZu9IKX5uUjCYH5VAQ1WHrnyafX7W7wArADgKbTvZKMy0hy
	/Z4DjvwTWtKcZr2kf0393hye2tPzp8TLupljPeh1owTibMFgQZGAGNhUDqRcargoUwJTJ+XC+Wq
	HbITIt1vQnyUeYn1soeG2X7u9yAmHz61MCNUPxgi2UhxxstDmgdwNYvMFvb3I+CYAGfLz/vfPPK
	gHc7HQjiaQZ23JhD0VhP0zG1AK+4ekI5wyuFxtInJIC3eivHVO4+NHvpalAf8cJaXdz/qSn8uMa
	4SY69FNKRAywJw8Ybc2thjo2eFPH8VGTce0zUnn5dFkgzDS48VoyRoB8WlH8x2EPUTevDqckbYV
	wOd0T0ozzMu5mQUBo3dL3d0rw5RHS9kt93IKBP7K73VRA2lQDUEa5OKbC1Lf+ixFSHTkcbOB9+W
	mWwvBTV4BOrE9B3PEbeXBP96cKKDxw7kKGfl9RBslxsCOOtajXG6tXOfOkrxArpWNcjh/z9B+Og
	hRrZZIg2cyYHvgtxEzlDjAnJeC9lk/2cmlsZA8l9CyRo=
X-Received: by 2002:a05:7301:6190:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36f75839295mr6934058eec.15.1794044537919;
        Sat, 07 Nov 2026 01:42:17 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm14392110eec.29.2026.11.07.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:17 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] soundwire: stream: Prevent m_rt_count underflow in sdw_stream_remove_master()
Date: Sat,  7 Nov 2026 18:42:12 +0900
Message-ID: <20261107094212.3951983-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-4-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-4-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
