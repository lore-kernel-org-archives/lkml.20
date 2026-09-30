Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181344607B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752974; cv=none; b=PPC7AWjyqRWiiqmU8s2KkMU3+nnohTxkPsnCcCckNgpzPe+heFNNWwF5bSCoPp7cjOzlSXlsmHRZHS35McMaGOMTV2t0Hod4kBxp3Kzgm1DJToU9mt2frl1yjNOtocrmtLedbb8L38ucKezwe6LDuZTCP49Udk2WNwizv4axlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752974; c=relaxed/simple;
	bh=Joi2OZuTmjgbDN57dzLD+JcRLScvJC3JC66V30FnFJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fW+cff91WP8sPbbBm0EzFaLo1l0dOJKjsgb8k4dqC3NG+rEEW/13abbDM7yJH0hYH3uaBHSw30MBa1g1sfK7+aRCdqRNkWjoRab8R/HfOU0Wt4s94sQoWaDZ8OXfri+yWowrJotKruMpY6Z9k+8S3mtalvsom8AJ2Htz06kvxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEICMtTt; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEICMtTt"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1dadso2603409a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752972; x=1791357772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Joi2OZuTmjgbDN57dzLD+JcRLScvJC3JC66V30FnFJs=;
        b=CEICMtTttVfLi9+k2c16ydDJ8mWbdF/GDSH0RsLpUd1HgBCQbLCwsoa/vLZkKhjgr/
         W12EonsHLD5NOkOwWq3t5jVfZqnd4aZzZH2AEyLrfbW8HwliMKBcKl1aihbPHIUG3to/
         M54Ms+nRiSHOq983WBlnqRnOkma3PiUgfc/JDCdVBq4wpTbFpYc/k/eU3wDpfmhJZrbs
         uLYVZ7nbaXX4NoEIVMuIz79aOS/rNoso3ao/Y1LZFZlvJ8gjCLoQxUPNVOwaDxNY//iw
         BVLuwX0Rq4LUgcuvHvYLf5bZrgN/PTCpzRuZpvEJOu4pnifo4EkDnswEpQtVxQD/f/Li
         NUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752972; x=1791357772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Joi2OZuTmjgbDN57dzLD+JcRLScvJC3JC66V30FnFJs=;
        b=AEXYdeF/6lgA0T5c5nuR4mfkldzPDULILNPn4ge6+yS6hAGtp/EvxVu9KjvYu9/+SA
         cyNdHDAbZm4nW84jLNLFjTjGIzcV06Qv99Eb27RhLexyzFY2bjtozz4VrI9Oum0LfJl+
         vUUYiOrQMTbBOO0Kx6wDE6BxuyA1u925VBUiH76ZkSZk2ZWvyKoyTeZw+j5e8KULmG4q
         6MH5JSL2RlC/3AyJMINIy0oQ/05LKXx7VfmdaviVdx7IQuXlyXjQTWCykVXqey44kekv
         Kh9BjOwmYkYmEzSw7w/rcPqfGML57NXlFBMUUEzhf8YTpTzjOZHxWtwGfdvDpSqVpmcd
         uNKw==
X-Forwarded-Encrypted: i=1; AKwUvBz81ea0x5AF3EfFTlaVaYGglvqjlvOCRj0qlY72cVG74WuGy8vhsYiLGYKOvkPhbwojLcWjCh17orDA9Go=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYU360glBKO3M15kviqdzEUSUTF9inZEmZJfCl2ItcXSZN2yXw
	nkPSzAD1EGmI5rvJe//NZDD7KPSGxKggROjWLp+yuih5UNGvy606gxmO
X-Gm-Gg: AYBFou0ewf0CO2tDKJAkUOkEdzNkeN0SemW720IrO2xQO1KxxTrtg6TW5a6K8qItIXw
	0IcqrUFZ3+hSzUybicoqqFUTwNC+eRGzUYoPn7laaMgZ8v7KGpnoq93BzYV2ayl30ahIvDgJxqX
	oihKd7457KuUzpmW7QwWCwXILF6DvHV4cC5HkKmJmj5ycSXnQtXk8sVbZgQjVv7HhB6J4+Yg/Er
	jKo1D4tUlagfD2KAHlauO33wd10V6/Sd9eLiSpPbHjMdBaOG0jwqkT5WEBXftkQy1tDuLQ5NdKG
	3esiTnSVDz3nu5ktiwNgCrUV+U8GbZu3jVUGRI+mElXyN49BngqS6NFI9uaxemBQDx0pOfSF2AH
	7nUWRG8OAkB7nK6q4EgZo0mdBYTVqa2YQEyxjWnVB6zKHkpWjaQVS2z3NUSYiUNdz0O6ziEGGDb
	0Vdhi5gLdFAoJ/9X6sCTBOasE6rwmpo3oizpzb5vatMV7sbUVo1BiVlsKAq99p/4ev/1/aB0ia3
	+RnfJT8NrnEF0MVU682gE9J1X6A0dXmIF7t9zdaVcnZTeIHul4kj3wzwjQPNqkS4Lm4cylgL6a/
	OoN7EBcp84b8fb1qfTW3bv74F+RJh8e53lStXFRtHkIaQ7zdeTDMCAnRdkA=
X-Received: by 2002:a17:90b:4ccb:b0:3a0:3a3e:f78d with SMTP id 98e67ed59e1d1-3a4d18cba19mr522044a91.47.1790752972125;
        Wed, 30 Sep 2026 00:22:52 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c75fcda5sm936078a91.4.2026.09.30.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:22:51 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Anders Larsen <al@alarsen.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/6] qnx6: validate di_filelevels in qnx6_iget() before accessing level pointers
Date: Wed, 30 Sep 2026 15:22:49 +0800
Message-ID: <20260930072249.1167653-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930031604.70544-2-benquike@gmail.com>
References: <20260930031604.70544-1-benquike@gmail.com> <20260930031604.70544-2-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to the cover letter.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
