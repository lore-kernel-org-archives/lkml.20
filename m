Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC69A37C11F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583809; cv=none; b=RdmBs1H0zGCw6G4AOg+MNL+z/zyoHcjsIUHFDU4tXixVQ+1S5kYMDGyoKgHYc97sWr1thUBlHHqmBdUWd/CZDVCWtWfZ39gLG8rasx6eRLjA6zBK8V9l4sSe2OoVcq10WuZg5ZF5WDumnSETsnGuYD7RLu2tm9Av6oryLCg6nUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583809; c=relaxed/simple;
	bh=RqUXkvq+UXggpnZUmpB7u7ETkytsnqwUT8y6iZwRB+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvlECEnftT8CQi92/t6KyTgvlIcc46LnhrZqUrGdc3VVS4+/gY5Rp6ZRAcVGNVftDfm49Z/S76nMnX6owoLMKhoME3eGVgjfhcpCVotqYmLmIS1aZWRS8Q8gIRoTpYCE05VUuKn02aM11DLQKf4BexV5tDNjvbnhWscABIJo1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwpDAi+6; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwpDAi+6"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2ada3f121so181933a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583807; x=1791188607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCSsLPZpBQSxCmBHl7x2KeIrNsy1qqAi41MGrgkLwNo=;
        b=XwpDAi+63NsW9c2tCeImVzzVprOgOlUt2bqsB0X/EQfBoH7OR7c3pNzxkMvoliMkFv
         9nqNpHf2I4RxUjxJ+1laHGZHs9SvxN/+hSHtXbyhr2x+8bi3jum3/zmx+Etj44mSCCUC
         hAKmcdAeC6sSjU3+h3IwnDs2nLsn9CnwzKHSwcUD5fKy9GAucyram4smdNRME37hR4h5
         ldo0fKdFkj0LK/N/bdT8BADu0BFwagJIlb0Ih2biKsL+uIbV+vg8dZx+jMUsl7+zPTGR
         WR++GbQONzpjEvCtmHbo8DfuY+7kWko6wEvq27l8B7RlYFk9yZ2tHukuD5blb9hg3VHE
         1Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583807; x=1791188607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCSsLPZpBQSxCmBHl7x2KeIrNsy1qqAi41MGrgkLwNo=;
        b=ccVfPEUAnlPTb4vTi+3iTfCxfzDs5nJrovQOH4RVsZ+OtUOa0taLs/4EVacuC+D4aX
         tR6LGfij7v4iCEsxr13EuAGEmRjEV/cqOk+nweLRb7deF+V6iLqHcxdvsKW9/2YiZTOj
         lNBPR/yY+wZ1fxyYPOOA0kLff3ygVZ+cJ7Hz0OhG+AXM8BawolY+psmjUkXnNyC5GLLm
         jU3u1ezhXdaYP+AFGc+CQNGdm7rGTUjIEdmv9eswVsA1//6qobCS+h8K4NbtRpp6pT6g
         CdVEfeRWOm1IHm3u7uCyuwJ2fralJo+RXb92jDWknawVJ8Va9CquXj89annLhQciHWPh
         dEAg==
X-Forwarded-Encrypted: i=1; AKwUvByi6NF0u7v7BcdrzCSgvq1pjSZ4a4YDOsD/6OJBjORbyPAPDkHwMx5e9emCGqs9H4aiyW1G394oh/2nM18=@vger.kernel.org
X-Gm-Message-State: AFuF++nNjfdR6nR0Yxj/RTwY+2mrZhzKEEBnQ7hZbXTQAxXbhhbjJ1ms
	ADIg6kv4OMNw30ePTbaoQWS9zHHzdJNnXfVKNBn2bFMGCO7gYc3NvTZUphHPDs3M
X-Gm-Gg: AYBFou0vb7QUTICzRyaL+gToI5O7RMFFM0g0ukD5H1UPpXIzgq2nJj+uWITX4tPIUdY
	EsxQB3wnD5DVaNG7gcr269vupXmSdeV4smF/yTuQ0EsNd9EvjrleIOy926YQsVC0xDF5GqjnzvB
	jPGFqMBw0lglqBLppBjHXqfyKsTJEjKjbDeur0yf80vmAjO4xbrEdHqsKQmrYJV/8mw6QX1ebXA
	Ol3COa6KxPYXsivnTpHwITyO4aoohdDJUoNg7JHeDctKKDVO4LwYEdG3psM1NaiHIbpBW/CmkuG
	16ipJ2snZ+I0ycLNG4aOraxhSVUqaN2tFXVRpzNncsvHeb4DdlzsPtMY4W5QhmjhZJgM7mi+h2n
	n79rTfa8sXk/mnocxiVVwldgRG2eIDRNdv8EKa4LS48H7EIsUjUNL5dLwUimNt1Y+HW7EVF0sRw
	cbBks/bSKlblQpCPSvVy6xAce+daQ7zuNj7tSeeoRdMykKv6+KvyqXqfskD8yWkH0za3b3+X8AN
	4HiUG+UtAsC1A==
X-Received: by 2002:a05:6a20:4306:b0:3de:4f5c:a9ad with SMTP id adf61e73a8af0-3de4f5cbe8bmr5554848637.1.1790583807126;
        Mon, 28 Sep 2026 01:23:27 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7ae09698csm1436154a12.31.2026.09.28.01.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:23:26 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 16:23:22 +0800
Message-ID: <20260928082322.10078-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-spiffy-calm-mongoose-828a04@quoll>
References: <20260928-spiffy-calm-mongoose-828a04@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 08:39:55 +0200, Krzysztof wrote:
>> +              - acer,sfa14-11
>
>acer,swift-sfa14-11
>
>?

Hi Krzysztof,

As I mentioned in the cover leter, both Swift SFA14-11 and SFA14-11 can be
found in www.acer.com, but the UEFI firmware reports the Product Name as
SFA14-11, and S in SFA should have the meaning of Swift. If you think
acer,swift-sfa14-11 is a better one, I can update a new version with this
compatible string.

Best regards,
Jianfeng
