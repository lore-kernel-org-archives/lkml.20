Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890693;
	b=u83jhHvOC8b8C90NpGOePlZ7a/QuicPsqtVAh7WOlz4F3Q1bJDkKtOqeZbqsCSP30IIb
	 7zU8IKiJoXRDRUcNaRa8JKRvgv+rG9PIPNI3UsEGLG+YQQFnHDazT1Onp2w7xVQORHSGE
	 w7IVSCSSaEQx7sFLSWg6D654cMI4f9Ec/mq6vE5DbLjz6KqA6PUmjfPCZQamnWS7ds6av
	 5u+lrPHiiIWnHr19m4MlrQzciExeAt0UQIvtETXb5AKoh0gnyB202xumzY7VK6ckgyuMU
	 IVNS5Ze1BtyUwUXS1PXiGGoe3nB+PlX1+CElqOm9dh29GBaunc5G1TAUU7PrFoL8XFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hn7DIyqNuP2b34oU9g9Y7BteCnzfw59mx0fOP+oR+Qs=;
	b=ik60w3tdgPln1T1ZgXjgVR0kdLm7E35h/82wjGkOy/mDZ3wYX6KjOa1YaDUgFYuJySqO
	 Je6i5JR0G9ZYrRB4CAMPCuRYx0FZ7OVf4o0B8xQMvZSMvj59vtByfEORIML2XaqSkoGmW
	 DZ6fKM1FFJDMWu/gv1qwJ4TkfBcEOyGmcMW8TZoKSPs5kmVav+iuy6q7PqRuCQ1uwHril
	 dY60dpbUet6gqh5cuWQZTp8v1bVtkOjp0vR8LOV/bz1MS4K9s/GxmtE+X9wz1RQjuDkG3
	 3RZj/Ji+ei5miLmdT9nFmS8KuTBhfPzuFLGoKHMEAe3Fkz7KajkozfLNZlAV8LH7R2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=r6sqVUZX;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC76082BCB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FC76082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=r6sqVUZX
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843cf077f10so2251580a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890692; x=1794495492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn7DIyqNuP2b34oU9g9Y7BteCnzfw59mx0fOP+oR+Qs=;
        b=r6sqVUZXivVnJbefEQtEiFNwFztPYbz+vit53xzJ32f9GuGRyifwNbUPnmJjDLg1pD
         QOGCSejdWpaM8j+jlYeCdOmoZDOVsgYq2nQMkjhsr1xBQkDA7UN0Y8wWz0J3RTUb/8nd
         sGdF7/j2btMMS30JuXyo95RAo5FCzkMhHPoul3ZTSHqZXl47QRESYXHW+3G7cjh0ewy9
         Hmiun06Af9rgjJtSPfAVnxa4qNv5KEgihX6U2sNR+x0K05jmJ82ssN9H5Yod9R2LMlS2
         R34jic2/N9MWqpjVEklzTQ0CFsXcnvL4ZzHH+d0Q9B2Gk+h844HLz+CF4PQNg/gx3KGE
         BdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890692; x=1794495492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn7DIyqNuP2b34oU9g9Y7BteCnzfw59mx0fOP+oR+Qs=;
        b=qhCinnoRLP0O+AkhPub0l57Wby6IImcimq/exJUNO/483d7rp8e8F3IcsTAbB7vO4s
         9vza7wl5VSR1paybxsMojZBl18SQxswiBQa0X7NAEe2cfJ06fIoWHsPaM7ruhKRtFtJy
         tVH+NGs25IyGSeL5w9T71G8foIU05wzHAva8fApkGxaR+Lvxu5JpKX1n96QsI67NkquS
         0dB8rzxetkspjg7ngodPoYRwD22TbwkqsWow+L8FmzvQqB69uJrwTq2QGsV3LY6JU8As
         mf8Fr4zYbw2zQY7MAudwwkKZgWY8+UJPcC4BtBJQLEk6vvOMzkiY8nbG85StM3VYRhjr
         HB4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgrSsiyfdxom27g5DsUpkdTyzj5/LABNxjN5jaJixGyEkRNUR1Alcra9cSqNcrlZlYQSe6Cvt30ALN+Kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VSGzZwYivWTwQLTilx6O88P2hiPG45BFnX6hWl5dl/gjUEY0G
	AIQNT3TPgSgQB9wbIdG11K/ccao9TFAwOgURBHpBRf/fhxo5GI6ammVYk4+BHvwjg50=
X-Gm-Gg: AYBFou0PcoaaIHIBhoGMR0gjPNAq3GgM6+ZoWOIH1kP1gB6FYuurcx9CQlJCxzq7jIC
	kJph8U5aBwXXJufo1ayYZOxv4GQOzrJg7DJzHaF0NqQWcyN5+naeKHTxEqrsqmqK38jU/c3aWXN
	cgQ3WecDhu7G8Ku/Y39VUozXH3MNs01z19KZLksnsQa7wXanY9DVvnk5gIRBj8EVc1c4R8dtTd9
	78PtAMq9pnqU9C1LfA9hIsnQ+MMwHLWACBnq8JMrbFwm1AJtpeH/f/i0uHPLtrHndHPyxPdaU65
	092RzRU5mKN4vty7vIX0Rh2ENhx/RgRA7M1MWbkrV/+WQihjRUKhrunNPfgNxQuhTQPnu6pIa5V
	PeHdlFJSfVtgAACvKSKu2fzCNcPedJyaRafUBV5/0QR9XOsbS2KHwoF0S323qrfQ0UnC6r2ErEa
	jJ3URg+h+R79N0iipfdon0vtvLbhVS1Pt6rj7ZV2FDdDLZ79bvAq5vbliLcXwWSFbH0J9A3FB+k
	lJwQ+7mkPlPmHUvPze0yZLfMfUWXl14qLu7rVtlJjnPoVw45v2tk6RZIKB41o3q3aKFynnOt+kc
	WGThgbs/azGhBQLFKG3IG3Drt5lY4rJU6NUAIJtKYBIH4qezO1KERjtcaHBC7RyOPBU=
X-Received: by 2002:a05:6808:bd1:b0:4ca:8d6f:4258 with SMTP id 5614622812f47-5640de8c633mr13324711b6e.37.1793890692296;
        Thu, 05 Nov 2026 06:58:12 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567ab6a5270sm4310420b6e.0.2026.11.05.06.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:11 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:00 +0000
Subject: [PATCH RFC v3 09/90] user_namespace: keep legacy maps out of the
 window
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-9-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890669; l=867;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3DNbAiv5YY/0l971ScuuIcWBF9qKpzQCcQBZsUbf/bo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHsThy1r1UYEjK3Ww+H6ETzMdfrQly9RwMuJS9o3wIin6wDLUFrSpakc0HOSoVO8JGNh8l6VjEK
 gdSoxZMjjlgo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

It is safe to hand a block of ids to an unprivileged user only because
nobody else can hold an id of that block.

Refuse to map an ordinary user namespace into the window, no matter who
writes the map.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/user_namespace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 4155e2e77497..5c2cf3dc02c1 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -1230,6 +1230,11 @@ static ssize_t map_write(struct file *file, const char __user *buf,
 		if (lower_first == (u32) -1)
 			goto out;
 
+		/* Those ids are the kernel's to hand out, to cells. */
+		if (cap_valid(cap_setid) &&
+		    cell_range_in_window(lower_first, e->count))
+			goto out;
+
 		e->lower_first = lower_first;
 	}
 

-- 
2.55.0

