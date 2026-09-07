Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130064078D8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764357; cv=none; b=LS1agKOJvG3c7pOSNm0ZlOWJ6Ot4SploekZ96giw2cUKduIv7ZRqVyARFoWbDcM6tTzxNthb7NORdUB9r3WaQb3MwGKZAv3tcyTDdJjmFtWSt66cU6pJV6wo7ZxDxJxd+vCWIqtpmG2jnKoEAZVSARSoBnj5Z/HCNYO/D7QEjmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764357; c=relaxed/simple;
	bh=XHLAN/1ZyPmNKfKxxnn40DYE5eIzz7rT8NpRDjeso+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlGsDcsmqSp32tNIiE20UcV8c1gDSnMWDxMiOfFR4pD2hpe9gux7DGT16G/PEliD4iD10TV5rVjBHuDeXj/BxAcyRL7zN9E/l/0NpAl2Q8CBF1xWTzBqKlyJiLNR0tcz5xU8KRmvol/p11G2V+adfysPLUgatxe0+bCmaX+jWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in/OFjY7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in/OFjY7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so24665115e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764354; x=1789369154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9cOmcuQayUUNCvgq+25CsYuokAcgEplB60+U0kvgEU=;
        b=in/OFjY7luWDZpD4TRNp5u+cJxkzmncro99nJPxSNykNj0WqSqxcjjLrdvfq2PqzXq
         eOrdCfiDDGela7WFRyCjzNKu8oSF59Pzju3W1lJ5aWPzHNBExiApzXQhQqr/yOCfjZmT
         Yes/39eHDgX3e5AGxMtbmUHpEkTQiQCHfXB0pXmpC1WfMc4u1a3Phsz+QaJpwhMMoT6O
         gLQqw1dh8RpSGDB6QkCoHr6ZfNbJybMJHeaJu74DO7Npw3+u2Qif5fLLZ6TBO+jj9r5X
         feOi2/aKdr/sKKd/LGzHCdSOrHwlQFZQ//xola/QCit3qZXdLYEf0PQYqjBIl4NPrsLy
         ohkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764354; x=1789369154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9cOmcuQayUUNCvgq+25CsYuokAcgEplB60+U0kvgEU=;
        b=SZ7yNZutrJjTe019ASvXzAWMnWG24J8xJs2a7XwKWoT5x5dvtJTHDOPdDpRHSf81VG
         s4u36vLmIye3SJmomN5Pe07vxh1ZT8VmWR1R5BMv2u5zRXmu6e9up8XmU0Ei1WTRYB8n
         +fnVrJmHvcvfSHK2HvDJ45y5SaVWeE4Y+N/Us39iG6AIeDLk48CB+Lzdn3DXKxfnUxAL
         0CshqSTIU53ysN22UkKAjO1TlyyDPX9GbCEKRaPddIJQRmd2rjIKy8E31UqO0MbBKmUX
         E3BzkKhAhtSFUB9CwFKxFFDQlfQpbFLVssU359vGv+2ipjuj9PBjRHXrxIRQCJ0rvqQP
         8IQA==
X-Forwarded-Encrypted: i=1; AKwUvBynRscc0o6K1mByyRc8reZGWj0CRXZc3wQhC14um97San1p3SQYIaLlQz1iRvD77YdWdq4mSuKNVB5kTkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nChlcK9RV5W3sCxQx8bOZHOgfsHIX6KuEKsMTj/Uug2DdAxpo3
	1uUWaote4hUNMqZDbdOAQXFQm4jbobULXTdHGL1BZM2XhxiTUtYBROoV
X-Gm-Gg: AYBFou0zBGfr/37KQVyqaaQy1uGWqnjHKVHFgvP7+Nv2DrQ+bZKd+poRZsMycA2aRot
	QMLBLxk+juc7/bDGiPs0BOGyf+VPQFtXF/f0YC6gClvdTOIbp846oym0rzZWWwF70yIvwtPqnQI
	2hvrATAElmKoy/M6W8cSjMJFxZAPdEzcOKzTNg4WqEZ7yApR503rps/G5paPp/L04vba6FREY72
	+DRSNxWM5hI8DI/0AcwB4bRaU5EkHqUJtt9jCs4a9HHaRJnZn+Bekn/r7bwdQU4Zg+kQKHDzavb
	r9hCv1lxtpIs8MpryK6ZYFPwIgZKcrU8rJ3JI/8B0M9NChoDi5xeNC3HNp8DQHJBnRA89ExM8CN
	8yE1Aw4luKtS0EwSevkGIPJybt31q8yvm11txx69pcttfo5QdspRQH5DDN/p7N9DPuWythYByBn
	c432QOoi2iolImKsse4B3TaQM6mBgO/ydzc/RR3pgrTForqAaUgssiM8XXixMS3GMU+wlEP71Mq
	w==
X-Received: by 2002:a05:600c:34d5:b0:49c:fc6c:bdfe with SMTP id 5b1f17b1804b1-49cfc6cc085mr168534645e9.21.1788764353895;
        Sun, 06 Sep 2026 23:59:13 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm184723965e9.8.2026.09.06.23.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:59:13 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: akpm@linux-foundation.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	david@kernel.org,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next v4 0/7] bpf: Add user memory access kfuncs for mm_struct
Date: Mon,  7 Sep 2026 09:58:41 +0300
Message-ID: <20260907065841.4129-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904112643.73448e55f788fb1cdcdd12ef@linux-foundation.org>
References: <20260904112643.73448e55f788fb1cdcdd12ef@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Why didn't I get the usual bpfbot review emails for this series?  Is
> this a sign that all was clear?

The main work that I have done in v4 (compared to v3) is to address all
bpfbot comments. My undestanding is that all is clear now.

> I'm surprised that bpf even attempts to support NOMMU.  I expect the
> user/tester population is zero.  Perhaps just disallow this, if it
> saves any effort.

I have just documented that in the cover letter and skipped the test
in the last patch of the series in NOMMU. 
