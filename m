Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849125;
	b=nHGQRCyZhQT1+8lH9WjtnN+lHD+NexkqQbzDywWt1rl4C0ibC2GZR/9/Vly+J8pQJ3pB
	 P0wLAlqDnmWLqwcBpTR5+KefxyjDsI5I9neIuAJJbQioiJvqTPKeoebisSsBIK9rVzoBo
	 JosjSldcJnB3E/ykYPDqLeWsa+11c/nXxFJ9ru7CiOXLmoRxllCJp/U3CYoqfxu3mx3W6
	 JT3JjlWBcX0s5u7HlXRX0ipksZRkSRP6nR6TihBTvAjxXJgracm1DIYCtpeKMrN5vDlD6
	 2XqWgwfoPDaMkKG8unKsxqTIR69dmahqFQWaqR8O9lzlYH6Em2Cl/xSg7vHYGUO1/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vR4KfclXf/MksyiSXjSnNtmzfaMI4MQnwqin6ectd0=;
	b=LaovsKVrk6+EI1aE2qPZ4j3Dsx+Iigdd/ILKpSD3+zhbA7hdtRNpR5AAO1WCMGrXAnPw
	 A3g7ILR21RQUwkMJzmAkx8Si2q4brbZj4P6pz2ZDuzRWLVju7jklsFGhx/x+0CnZ3RzrS
	 zkbZZPaGNE37eS1E7DHoSMN5UWSm6YJzy1oCCZeKiDman8EEz+2/7p42guy2Rwp6GHOIh
	 JAA7raVS/k30f49MXzvnJGk34M7jhWnP0amHp+dkyadCMrWMbG/XAW/nUAAT+Tzere0TU
	 jx/TAF//I6eRksVEPUx+P1pa0nvIur3YcivQWBrJU7SzL2KKM9g9CYM/8FKp2ljg0rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TlkUUbd/";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA028606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA028606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlkUUbd/
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3581093c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849124; x=1795453924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vR4KfclXf/MksyiSXjSnNtmzfaMI4MQnwqin6ectd0=;
        b=TlkUUbd/UUd8L7T+3ZF8nI2o08TzXT3DHk3PiFXiZLf7FtdtG2TyxlKY543CMZ3/sY
         yyqHXXY5hldAPcZ2F4AekvZEsNP4rSj9x7l1Ip8nr4VbJtwpVOMsl/7wxq48C1KXeyPX
         9HA5pPBWxgGhj25RVo6ZTLXy4EpkXonrf8P4kRNdfi6t7Q6yw53KLNFQutWz8KZ1qiK2
         rEY0TMXhCPqeeZja+o1loWSocqUNGBxMqAv/DEYWtPZD7ImnqZAecO4jpqIxdl4yUPnf
         cJnWf55Re4qXprVuXXruGn9oRLJLx5WGJMB/Ulje5pShH99jnKmdPzfIeZi84lAF1y1B
         JXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849124; x=1795453924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vR4KfclXf/MksyiSXjSnNtmzfaMI4MQnwqin6ectd0=;
        b=JJxybhbffbc6fVnJZQAxW6gEdK0h6VIUXFUSxBgIDy+eEoqBkldiUICi+UciPlh3QZ
         auovKrBWrjgNNunBmlb0gYBeq8PvbmrU7mbqIZFgkXvWl9m15IM3jISQjqiohughQtWD
         UqY213C4DQnpewBU57GoHWgDV3Am/e8GCcboEiELY3yucMr8cY4G9WI4+OTLQ1S8oddS
         IyLtyuhOJxyKRSpO1KppokE0ftkKG5ELLHAH/3510n73Uw/YB4z0r5QEb97cnXep+lYX
         Q1Zn/nZ14yC9T6L0qQ+VvbhsnnX7PzzudQS84wVCQTAOlfy98J9HvI8D6M5pDp4PmvN3
         FsIQ==
X-Forwarded-Encrypted: i=1; AL+hErGtCq/jwrEF5TVRvsUbTTMcT4r+igkMPFmHOYV2mTtB8zR2sdEX+Rx4CbrrwLT1nKxWxB0P+X68dnGEwpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LajkQet622jjUiANQg5+TBZW1HFGE1oXa5r7Mqq9rMwl8pPgM
	f3JCvWx4f+tKJdChTtsu62hIZyX7fcB5kw185uSH9dld1IOztxaAHiw0
X-Gm-Gg: AYBFou0sBZfh4qw/wLX24PyhHv1cNkNdsMXM1yECyh1ujocQAJUUag7VZ2JlKGZNQVx
	2KbuJfFD2bOpfSUQBbozGJjGvOjpc7isTXFUtMnW9fWbxc+JJfW7SA7KrnNvGA77poohG8ZJD5K
	2r2WWO9RRkNDbW0Pjnt7/eR8STcRnW3blC57586myOcyon5wyaZsdfce4ExE320vioxSzutVT+D
	pqfzdgeczURNa72e5Dn+67j4sb89YXvOM8tfuefS4kUjsOiTfYqm2jMUFYMoB44gYznsGq63o9M
	JjtgZeK5UgipR/6i1ihc9QvnE2uDkVmIM/+UO3ZIoNHPE8g6jKkpy0JmIbG/R+K0mTTIdbwX8u/
	4xO5b+h9yx5IPjZ4djOOhOALoD9QtIUuL9u3iaXLPso93HlcZJVWGo4g9j9HN1Iz5xwwAciuUgw
	q8Q3/y58gawygCRnYvuxYeIN3ai46xlJmmaxO2SXwg4Pwe/EteyrJ5Ec+OT1B1GIBWfN7pYrE6Q
	oRf2j/6sDkajgso1F3/bu2eJPRZvUdh8xypJHvjloniq36l6x+OO4eFUpAa/ORPDMb6qFMgEasd
	j0p1UnBWLWy8tJV0DonnBp9+9ZGgmFKoFPcH9BTgOpwLc27i3jNnpd3r94fnnsZxez6tkuV0/9P
	d3LJQb4qwbeVf+/6oMs7nLrjCOfn05Upnl266dIwC/ytVxnA78KPhlKxtgiHgAx3Y9KlAkbrfAQ
	HEKsO4jsJf7r7Nsgts2UX8AyYO4cR+iqRFz5ZTC8tYBQ==
X-Received: by 2002:a05:701b:465f:20b0:1b5:281e:1702 with SMTP id a92af1059eb24-1b5281e1b1cmr4125651c88.41.1794849123703;
        Mon, 16 Nov 2026 09:12:03 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm27976466c88.10.2026.11.16.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:12:03 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86/intel-uncore-freq: Fix error handling
Date: Mon, 16 Nov 2026 22:41:57 +0530
Message-ID: <20261116171158.19754-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
References: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
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

On Sat, Nov 14, 2026 at 05:49:46PM -0800, Srinivas Pandruvada wrote:
> While reviewing the driver code with AI models, identified a few corner
> cases during the device probe and removal paths where error handling and
> resource cleanup were insufficient or improperly ordered.

Tested the series on a Tiger Lake laptop (Lenovo V14 G2 ITL), which uses
the MSR based driver, so the TPMI hunk of 1/2 is not covered:

- max_freq_khz write to min_freq_khz and back
- 50 rounds of rmmod/insmod of intel-uncore-frequency while two loops
  kept reading the package_00_die_00 attributes
- offlining all CPUs but CPU0 and bringing them back; the entry stayed
  and current_freq_khz still read through CPU0

No hangs and nothing in dmesg.

Tested-by: Arnav Kapoor <kapoorarnav43@gmail.com>

Thanks,
Arnav
