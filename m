Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602069;
	b=IxTYmZbLbprqysXwinmN35r7iuEO1pmz0XxG+LvqTbPPcSTKMsPHL5tJk16zhOAFM7Ag
	 jBl7Y3pAW/tp9b+IShqFW3prPUTacUmOCTIgcDLYt5LW83HiZxTvinzrDAg8VO2R7aE1I
	 jrOZIiip4ZoYGrdy+KvN947E4WvWK0WWYQZY/C0Zsq9JcfCEIHLs8arzI4oxSVIjEt11A
	 g2cnBx9kk6VmJ11C4Fmuq6wtm2U/bESWo1YODFLqefoQ94zwUwqZpQSfeOpd/d1lIBx0o
	 4q/mipet51OuDVVN3SrOVoshvs9GwZtz6iroaU9UAwj4LgwU9D53zZ2sJTNjkyG2o3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gEAEhBrLJ603lWBwjrR04mty+xeSSypartbn3lk9UKk=;
	b=UD1cL74wqZ/WAZzTllO57snm1wTazikp3Nskq6Ca240eeicgLx+8KdaUK3BSarHz4+Io
	 C0c+J6IG2/Z5jfGQCP2SrafU1el1gw0mtwuGCHf8JxYWBx5TBaLFjXJZo/03/BTpw+Bob
	 pM3pdRocycyyeZsETnGmcy3lNsPjxkBa9Bzo2WZP1uj6PUP6EWU5P8NmJJYwgAlgVu3FO
	 kHhR6XJvSXME8Sk/TTq7ojrAKwrl8LPT64MWSJjZx1ckFzlbWyigvnxvvFDNbTs1UmpF6
	 I4CAu/BPfCUoxf6vm2oOBYtIit0R7RE3UQgpoeb/dGQii8rQ8salHKEhEFLR+paaTOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DW8Zo59X;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1E8606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F1E8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DW8Zo59X
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0d09fc934so213083a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602069; x=1795206869; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEAEhBrLJ603lWBwjrR04mty+xeSSypartbn3lk9UKk=;
        b=DW8Zo59X8T/60vX6Wek7BeGGM2whjE3KD2aFk7aeZlGjN9tguh1s9BJ87QgebqpCjJ
         lunbDjM34L42SYpPeIuuIUHZbGpGih3ngRrlEewe5ntepA1LyQLewSUHxlkwsiOGM3pO
         3Sh9MlkwKMF2JxiDlLRJuFv079leRpiJxgWBAQls74qktgjLcP90B4BzTd7fdSxQUsf+
         5FdBdKwd4xe7v0Mf2UqGhJicpjZrT2AzHXQFjG8rGd0+mtrndNKjATrCD3KfbzENGezU
         1YWGaKoHp5WdBFsBISOxJGaCFy/PWgAosyjX1E++54l9xtN5bWZV7iiXoFDOivQbcJEt
         5y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602069; x=1795206869;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEAEhBrLJ603lWBwjrR04mty+xeSSypartbn3lk9UKk=;
        b=DJTOj/uycdCtporW2XP8AcbJYpON7wGFQ4aWGeqJLGvpczxKTq1WfGbYBEhqs5lxYf
         jJUhyf6SCbiHnC4nfHP6qotBKtnPQ88cLNqz3/da94M+NH8KeI123FnsABzmoQu9B9Cx
         7DO0TQPy92iDZ3byxVfdFchfV7HvUMnP41QvXVhKWEXDMeXwVKW7E0dfGGMuBJcGQpR7
         2k7ogGa60qGs7lzuXIeTB4YdnFv4ZFeXvmdO3YA4Jt0SJKD/gzYJF8O7ofo4ghWhQ0eG
         LV9JlGi9hATfMgW5KDZ4nhBmmnu3rWhFF/eCmkV9qvFVfC0MDzuCIu5jZ9WCbO/8SwPv
         0pMQ==
X-Forwarded-Encrypted: i=1; AL+hErFdmn1ymPfjbn3bei1yeIwM4J0O8ufXVOc3NwtiW64BTEdIg0J5YgMBQ6vcGAIIgdtF1EEEgEw7jpAdhFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+ofVUaq5kKOgpuBVc2LZXYEdAqxm4ConLVWCLvMdE5WvItCmf
	BnPrV8eNcCN32ffg3/8aj+dqA1zzbTT+z2zJfIbh1KYr9iUFtRlxXi3c
X-Gm-Gg: AYBFou3Lg4PijU0E7rNM0lTwV3c11bu1m/72FIimQm5ESdfPJziznPl3KmGBwp0unf6
	cgb3QMsMDKehCS9M2VJUkCYhp1d772y6+DY4BqUsz8nYPUcx2E1oyfzcDY8E/w2NHvYmyaqXAAT
	oMyoJse6Tn/sBmcbRIpbZHfZVQoWosKP7BxkIQByLSer9huPIAfSDIOEp6Shsn8bSuhcD2lxHKU
	xuOsfmBIZw2FRaceFDIQoJNlYvP4QIlZ8RrTArRfmT1+YuHGajZVryI65it9pExpeDZ7Jb9b5Iz
	ifqqSMLS7fCEshIlw5S+I1pN4XbWozleg6XPGu/qhVrxfeBOIpxmuC+p3HBs0z4kVYJWu3FxfK9
	6pEs2Byp/YErvY5zbwSlkbmt1NMXStpvKVeAoybuT4zhtZOaxvWMEA+O6rC3MGHxXe+e0v/Xamf
	5z93FLD/RC6NmQcGEMtPTSja0kk4cEmB3WfXhujn4RQjA0DZM4PC58pyFGuXk7OonMxvJomnoII
	Oc4InwDvITRwXDs6oOskeouVSkdgOTULY1Gh/du5lT9K1oi/qpEARC06/UXZ3n/PiFKKyu8Aa4a
	tmvZhU31XFtnnoxl9LFOIKNWVHcQ3LtI4ibSPqgyChKySS0oNY4T3bH5Xon88TCBiTlzsZTCcSW
	ZIJT0lARMNdop5HdBKdbUJwLTBl8=
X-Received: by 2002:a17:90b:2e90:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3b1b0a44b0amr5406901a91.5.1794602068720;
        Fri, 13 Nov 2026 12:34:28 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm5954809a91.2.2026.11.13.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:34:28 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH] PM / devfreq: Do not change the frequency of a suspended device
In-Reply-To: <20261112-devfreq-suspend-sync-v1-1-af64603ef43e@gmail.com>
References: <20261112-devfreq-suspend-sync-v1-1-af64603ef43e@gmail.com>
Date: Fri, 13 Nov 2026 20:34:27 -0000
Message-ID: <179460206763.199714.13518791714665074913@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Please don't apply this version. The Sashiko review found bugs in it:

- A limit change on a suspended passive device stores 0 in
  pending_freq, so devfreq_resume_device() can then fail with -EINVAL.
- After a deferred update, resume asks the governor instead of
  restoring resume_freq, so a userspace governor without set_freq
  stays at the suspend OPP.
- Two error paths leave the device marked suspended or skip
  DEVFREQ_GOV_RESUME.
- The passive question in the cover: exynos-bus children need to
  follow their parent to its suspend OPP, also at shutdown.

v2 will fix these.

Arun
