Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3F475343
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939875; cv=none; b=T8qmx+GbbCMztkypAmbTkZlzi7U8BKFiNeSJbdZhuFNXuBJA9Opmgq5Ix8ofBcdmFz/YLMx1FNwWsLF+B0hORZMl4BqKAKLSXREp5hVp96yWWhuYz4oGrrY+HpsOR47JeXYgM4cJODprbj2lSLJ8LuLPWpmWZ9wTE9pn8WLmSZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939875; c=relaxed/simple;
	bh=k5llA7pmOSBPbMKZGSq3pCo9LcSxO2kYJ33h106sOfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYM+xDSG7a0wl2S29srVmOj8352S3GjzBShki1ZO7PVE1aUHURptcpRIeUuCLhhGNw0lX8ppILhRX9wld448omgh4tV28rgi/ZJ47rE43cHZCZ7KxZBTg0+14AHwRr7W2FBBWcraKqdinnoLHy1fqHL0hlUZeoizroV4OgQF/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdBdrafv; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdBdrafv"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767cc7fso20602911cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789939867; x=1790544667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5llA7pmOSBPbMKZGSq3pCo9LcSxO2kYJ33h106sOfM=;
        b=FdBdrafv+bDVQr7goSmvCgU+Zzd9S3beNabGhFwz4zD8eAjVnAwUnFvXbnXApA4kr7
         o9eSm35poFkxOEXLWCDBLsq4Gc3+ZHppWgYJLvI9XvD22qp3OpRLP5xxn1CupNX8ETD4
         +X1Ix5MSKg5Dj2RU8XsHiH/jBQiqdAb2N1YLEnE8aBBps5SrwYppgIOYhW9XUXe422Vd
         pixaySUcK2wu+asD80loUbRZAR8yXkHFlTaox3EAYSWCP3x8hC7IDnHQGAlRiyy/MBf7
         Nud6H5Jcmj8wd/VJat3j9fyffSfmbyuiGlaQk6X0qLGm5xz3s8IdH+90ZoozzJC+eE+z
         gAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939867; x=1790544667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5llA7pmOSBPbMKZGSq3pCo9LcSxO2kYJ33h106sOfM=;
        b=yXDFv27zxPn+cK/6mmYWmfWU7wX4vd01cya+I0M+Tw0EodzGAUjX2cd3XcIPF2rbiJ
         XTHpcOW1311ljJPe1LhILLu3MwDcXEU32nkgnkfPN748CeScs/XlmMkxlk0aPqO6LSB+
         aHsdPUZvZrO1/sGJsoCgh3tl+CkeF8YeDpu0t3i2mWbQ0LBAjKAX8ij81yXf3ULweRBf
         XPvhqnWbPAb8Sa7Bm4azr9e8S6D0svvImtDjoETHunM6Nt2sOjdYVXieCg0LwaNwHTeH
         ASyTPdqIUfeXnUq7cMR9kHTJFNCxFyBx5luK+QyEGC55ggade/xoQDeu+fnkd//YilrF
         yIFA==
X-Forwarded-Encrypted: i=1; AKwUvBwvHG1lRb/L05WFSuuOyrwZdZ3UQjOACb6LOSTy2bJ+sexhJb/4n+t7uN5xjNoLWgCwDyWOffVnyS1M8NI=@vger.kernel.org
X-Gm-Message-State: AFuF++m95nSCxwEj6KtqZuW1xj4RR95T/zWt09hm8R5nid5NKdZnnQId
	XJsDC4RVUM5fsTJQ835bWKbccLphvaew4O5vWxME2muujacuJHbLmaSR7IV4AeGqLmY=
X-Gm-Gg: AYBFou28nqY86EVOqStmX52O8A9Idx4OAHpjuaBObAzY5ww86NkrB+rANMPPky+eHeI
	NuCF8wr/EqXTQU7h3Q2thl1/EYVzLShrF/30uBrRv3uKXqkFRlSZbTd0ngNZO27Rs5TZmOCceQl
	rm+/wyVbU+bIq0AsAF+nC4YGJMZi007NGwWsnNluiqs647pBA/w100cGrfR2P7xXd54ygLedyxW
	7buD2eg4MaZSFUYxJAn5B5Km8DNAGHY+B232JkmyZlI6arUtrPL7xwM9AtOB9VdAHy9XONhS+uj
	FjZ7jKYfjyhC5pFj2kHfGUQk+6WLV3cl66qMN8lmQPTXZdp9vmXK6GKU5D6+Mxl2sxSdv3SSHoE
	ctx5HhLJ09mz5LL+a1OK6BrmxU/yWrRhwnKljR7FKfFKdBiIDtrpMLJ/LFhhEO4FIqxqRPO4PMu
	dhcnANM4CBr8vYZMGPENZOcQFCTmdB+5UKPQemXLE0wWwPnSKZ5mY3DRfxHM+ekbK1v++KHoJMh
	mHgzLexE+sZg5olZc2hOA1cAla9dV43itM4GO11q64yaDls
X-Received: by 2002:a05:622a:110f:b0:52f:ae70:5e1e with SMTP id d75a77b69052e-532b71da678mr75696031cf.22.1789939866681;
        Sun, 20 Sep 2026 14:31:06 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae7737f3sm48503221cf.28.2026.09.20.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:31:06 -0700 (PDT)
From: Seungjin Bae <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Li Jun <jun.li@nxp.com>,
	Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: usb: typec: tcpm: type-mismatched PDO handling in tcpm_pd_build_request()
Date: Sun, 20 Sep 2026 17:29:35 -0400
Message-ID: <20260920212934.392398-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found that tcpm_pd_select_pdo() can match a source and sink PDO of
different types. Before sending a fix, I would like to ask whether
this type-mixed match is intended, and if not, whether you would
prefer a same-type check in tcpm_pd_select_pdo() or explicit type
handling in tcpm_pd_build_request().

The tcpm_pd_select_pdo() function matches a source PDO against a sink
PDO using their voltage ranges only, without checking that the two
PDOs are of the same type. A source PDO and a sink PDO of different
types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
be matched as long as their voltage ranges overlap.

tcpm_pd_build_request() then combines the matched pair with
min_power()/min_current(), which apply the same accessor to both
operands. pdo_max_current() and pdo_max_power() decode the same bits
(9:0) of the PDO but scale them differently (x10 mA vs x250 mW), so
when the matched types differ, the sink operand is decoded with the
wrong accessor. This misreads the sink's capability and weakens the
min() bound intended to cap the request to the sink's limit.

This type-mixed match became possible after commit 53fe0de9a35d
("usb: typec: tcpm: pdo matching optimization") relaxed the match to
voltage range only; the min_power()/min_current() macros still assume
a matched pair shares the same type.

I have not observed this on real hardware; I found it by static
analysis.

Thanks,
Seungjin Bae
