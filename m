Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F93B27D3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 03:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791345460; cv=none; b=Gnrd4AaGaYBg1TGVjC/VrgmTJb1iUQAgru/m2+QDpQObl6r74UFOAgRxV61RV+VuwUqPfpkDht/+Xp8kqGipvoIC9EfakfY2riqivROETapdJH6TQfwDiei8q+QNlcdSpI6+sqyT5HR2P4AcA7jCNN2CyCR65qn8X1AL8t1ci7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791345460; c=relaxed/simple;
	bh=uexnZlKrJFy9Uv64ru4W7iVry9vzMzmyMFMaf9QdqQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0GRuyFu9sjef98KpAseqOGn0kqRfuSFdHUSTV1y3OZAA/IO648CL99m9kWv6cP+JFeFYgWmWWSOajRGiTbnLUsnRa9YjjgffZwHadP3FXpo9tDB7mc5QsqeL9KaVdKmjZKImQCv5Jv98AaTD8ApPYqGHkYXY6AlhCUY3HG1Ex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5h3QAXE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5h3QAXE"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so645595a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791345459; x=1791950259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uexnZlKrJFy9Uv64ru4W7iVry9vzMzmyMFMaf9QdqQM=;
        b=l5h3QAXE0N7K/vC22Dt/Wo4sylxj5fnjPmzDOeK6vYIovEzHI810FwAoTlCjHJIVaI
         BCmN7Tt7ZzMVq+rR6bd1/bohvLYp+WEW5nfBt1ERaHMhUTA5QTuZ8QillKr9HsHStOhl
         1NxoIkj1yF6FuFYdwQTE+gpC4qGU3ia5SAqWlZrf+wSh9fdXXNIKmDyc6JpFwrzRjWUP
         Qk3hjnpqzWT9cCYKHmrZRMLqu9QrB6omxJYAjf3oMLMOtsYZUDfyOYF1wQ8CuEDELylQ
         tmrRJyYl8PpiF7q8tKWrohuJDZFyInn6hl49TVEouQGZopnqzHbT7D7OhigIWGdbKJCN
         aeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791345459; x=1791950259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uexnZlKrJFy9Uv64ru4W7iVry9vzMzmyMFMaf9QdqQM=;
        b=MkObTvN2kp4Oh0fjaF/M2qrKJiU8vXc6kppxh5UPVSu/5lLL5z4kF/Pvavxma+jV+v
         osTiVUj2S0D4FnO0iCXBKiFiG0lFV8xC/QnmBwFvZDDlJn+TpGd6f4iLcJjW0fsKRKWy
         ia+Zmt817tLuSMvKiGC8+T4EyqH7KcYUzqlBqzjshFUL4uxG1iBb28sbwH+k3T5Ej1IT
         PURy/xSukO9fG9gHA0ylcNb1K4EEh6PL/ju9Yq6koZotjjn+nTYzscnaxYGvvFQEmmjR
         2rFJEL2y85LLb1bhZ73sSpq1uMUJAIiwRi0DylcDYKXW6oXeJQ8EDNjqPmK/1vwrpssY
         pcsA==
X-Forwarded-Encrypted: i=1; AKwUvByZ+M2kGh97Fyu1X3Rqjnk6mPrDimvaXl11Xey3mVYfHYYxIaqYbZFt1VbA2L6rLkkfw9N6U5f5Q7Yc6Eg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHdvHvknFDijpB/se6DswYNSOBIrtUgXRFui+Iu4Lk9zcKvIJ3
	dtUa1qP3gpk8ssSu3rgRTMrtglxAubQgOC5iXDcSyfpnZeibEkNEAW0Y
X-Gm-Gg: AYBFou0CVh7kD/jqyo5bQt3SW4QTXBlxU7MUf2ZUTrTk0EWgZSK5/vxR4EVE3fY5XnC
	jm/q8RJVaiWeT/0YjzRDejYhp2xrA9uMaPHwtF2ldKqGla7ityqZXDM6IbL7Rl+OjVjC2p3sIP8
	ozDfckaSNzF/YxOxgyi8yI7tiEvJr6dX4qU/wsyOYYAnKWGnViYVWIFADydYGb+mfbS/v171+fz
	ftGMQ5j1a9f8KfL1luQCK4WK7wWjRcGXz5wPjyEOnQNw3piPk5yrIiDLJKuSzDV1d6OqnpbOAsN
	6gVB1LWsrBfvsg2+jb/f636wq1USYYj3tdExD4XwLOYehQK5KnEgy7JqrFH2BiaGfaBk83HRyXR
	SiLwIYFa5dsWgvpDb3vF3Q5s7bNFFykmC5fU+i+nXmUcxq4tkV++adPzbly3TLJgUg/vr93Cd4q
	rvG0b+3S6B4EhU6tbegfrDVt5JcZdZ60gxSQDrXAtXfKYTS3r+I0Zr/h7QkJ1DXCDYLsW0BQmS4
	kkhKSXNSoY=
X-Received: by 2002:a17:90a:e704:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3a8a0e0974emr508925a91.20.1791345458952;
        Tue, 06 Oct 2026 20:57:38 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66560sm7888387a91.6.2026.10.06.20.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:57:37 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: netdev-bot+sashiko@kernel.org,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH net] sctp: revalidate output stream after association connect wait
Date: Wed,  7 Oct 2026 12:57:23 +0900
Message-ID: <20261007035723.3470881-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADvbK_ed4ruZjf8CV_jGN=JPkJDHwwZ_9vx+q3zdHnFYiW8dLQ@mail.gmail.com>
References: <20261002010449.3689454-1-4ncienth@gmail.com> <179124882160.434549.10169630192303444846@kernel.org> <CADvbK_ed4ruZjf8CV_jGN=JPkJDHwwZ_9vx+q3zdHnFYiW8dLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. Both findings are valid. V2 uses the suggested range-and-extension
helper at all three points and returns ESRCH after the connect wait, leaving
the existing caller cleanup unchanged.

pw-bot: cr
