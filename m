Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246541;
	b=jykKocJqw7BZ+/92lQ4u5sP6YKq5ItTjZJbaQaVkDO/f+Dcke1tAjvBiKMtwkL/Qz9pt
	 HbFLVgEdmBx0Oc+KQ1WaBbhuSYIKgYSgcBnRVlvSkPGRlkSLM8W2BWzpOYf6PshLLEENT
	 Kz/r2YSVCFlElaqLzpgYhEVxsHQDwlsjG+CzIoKUtnrLHETkmERPu5RIRHiTksLE7DChg
	 2Oc/j7Rc6nw5+ct2ZJTUsg1riQDbGGMtYDSR6nkrQkjupE7z0L1tOxpNgQfWJQHRzr8gg
	 UOEnocxOeUpqc0Hmat1+PV9G+3yIR7wf/nQuHmstu39+Idc1p9NPHAoNqxhjMrvQdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
	b=FOyNDOjYTA3g9DR5dWpSZJ9ro+u1qsp6QlR3H5tZGbUeKaraGEXM2fHKufM5IXcgsj56
	 9vplYT73qrDMO7v7QL0gBPKDhnHipKshjLzMMSO4QANWhTQ/zo93MttQ3minS7gi4HafC
	 sJzU/AhTRIvG8XbWjTr1BdIZVP7LidRsSQ3A33fkcRP18OkPZO/qsBz7i+bHnCmE9p8kY
	 prAcWDhxz1QkYCaAaMAj6hxCji0PvlhnSHnpu6DL1J27OQCY0sUzePPugr59y1iwZ37jY
	 cQGBvePRYJpGXda3LFNp6HFaw3C90SShoM8eba8IUvJykE5i1XFN8SdgK2w/YpGW7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q9wQ32cP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E3606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289E3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q9wQ32cP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12400385e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246539; x=1794851339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
        b=q9wQ32cPD0so3ZqfuhtKzNTUawAwni8LAA8qq7zVdmSmiF2zoYuT7nv4t184BwaTAx
         OSusIKeJYV0aDt/JPYmkZUSgwBgqWd3VhxAejdJTZpysRLOf3WCdcgDzYXUgA73NiN4M
         qiNOwHZi/reQYemYTyQAQ/eTQ9rMsfpsbuBv9P2jbo5EhDzrw2BYaYlgQqzrh+LfNJBr
         EOwopcYxM34WU5x/tjB9XzT6iz7XSHllAYxdDpf8NzmVJVXzcliqMLHzvcmZFMMGoR/i
         g5qScX3lT6mQmHrFPjwmUrs3xEiFCQ8OeWMD/xhW81ym/Hvw9mHJsnjSi65NvzMA9CT6
         UhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246539; x=1794851339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
        b=Md4iCZMrmEy6O4Ei4W9gQzImPmMc99o5FJnDf9EoSE/UoSqtB2FBL/Cp66IIVJF3yy
         RQkQsNeZk6PY4E2u2kaEONU4hExsCWRr+NbL52qt4EMpldNzfSVVraNxDBeRvUynQBkO
         uMA7K5zamO9dIytxR/+7Ms0A94vU+8Jo9+z4zY2Yk5vd9HkF0ugT2ZfPqXj7c76G57tg
         XrMdn6KM3prROqRcw9XkxGpPEKOr/oFz66WWNgrrTvp9lcozs0FsXVslhKfqSzATonhb
         GTYr1uZlxmDpS2Ajd/duEVQhGa+z6YJj1oU196nxoBbhMze6+NUOIl3DkXceP17zi8VO
         HMGw==
X-Forwarded-Encrypted: i=1; AL+hErGMSJvLsZiXnO17DFdjFh9gVslNkJaZdV16kyKnBts7NtbLGKVZgRWqdYqWNncnOuPljIXxzTemCTz9yUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z94eAKXYzk+Y2g2BQGi5InocIQatJC9KgtIOmr7AaswOs8I1J+4
	d6rHOaBvUlrnnpA8/SahnDJToZLq6SLYHkmRj90kd7/5HxUKB3443cwo
X-Gm-Gg: AYBFou1g2rtdacy8pnfGEfdzy2q9rgej5Uc4UsdGOuXTI+BBZJawkBM3jecmE8Y7F5c
	ERO9vZIGh6phinE3Jgvx4+FyOM/pmae3gg1vjpx0ogLz3XCcnA9KfOk2bvVJj9PjfQiT4WqM8cF
	2gkpMHVJI/ffdltXbaFhiZRH2IdAgtX72umrav4KONlUOR7vcNs7iM+lzNP1F5sDFg5OgCcRKd+
	Xmnnc8VbXSJYl47krfizqfNikgDFbOD91ZMtbWjM9uYfCqIfsk91N7r1A32L7Au9CSctB5jQbYY
	Ht5BbRGbSD9zmzp3WEhudsZk2Q1yT3o4esU8aVs8bNHmA0mKU4T5Btcnb2T9A3zVrTknR+hUKfU
	nLlP9sScKs+oTCh5X+L6/d/HEVb2VFeVwxDSlrQuw8GengqQ+Sdz250TJy/ieop07t7+hYqFKtu
	1RAELh5GkNSYCvgg4R6E5athyqeW6tHcc8ENcqXJ0ujP8IT4jH3lNQbIv85J2tMdwrSWvPwyRsf
	0dYWc09zn4eSiQsZvggYftGIIE0GwJ95ptTH0B4jctQxuKfVSRVFC3+7OKZ0xfzvOZmNrha9ymH
	5jisBMj9Od0pTU7tDsXFY0dQUEc=
X-Received: by 2002:a05:600c:6218:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4b963c88030mr89979545e9.33.1794246539561;
        Mon, 09 Nov 2026 09:48:59 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d89f22sm7619465e9.3.2026.11.09.09.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:48:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Halliday interconnect provider driver
Date: Mon,  9 Nov 2026 17:48:46 +0000
Message-ID: <20261109174846.2091271-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com> <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com> <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
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

On 09/11/2026 14:30, Konrad Dybcio wrote:
> On 11/9/26 1:29 AM, Stanislav Aleksandrov wrote:
>> +static struct qcom_icc_node qhm_qup1;
>> +static struct qcom_icc_node qnm_a1noc_cfg;
>> +static struct qcom_icc_node xm_ufs_mem;
>> +static struct qcom_icc_node xm_usb3_0;
>
> Please take a look at the newest files in there, you can remove these
> forward-definitions. Otherwise, I think this looks good

Thanks, I'll drop them in v2.

Stanislav
