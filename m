Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890687;
	b=xQ9Gux4WsfHf4ogIl1je2ohPGjKSvKXMJJ+6MpCtOuVsjI7xka32wiNfGWEOOZGV4i7b
	 2auZGLGC1C/iAR2LSG7WmARvk2WdY9RfqZ/K2oeDAmOlWW8H3N6I9RLjD0xJEquXB0bCW
	 nsFiDL3eZDXndPJwhowd0M/Sl/kdlfGRjh/5QblOiIqqK1HrWs/Mec6RW8pqi2uun/Z9W
	 CzMLyZ4ND7aQYMmxO4QAr1VJvEhlAI5TxEYKan1Pzp1GdiNVkXtaoAQo6y0z7cXMcdSrP
	 rBLrEJ0s7a7yI5wOkwVD5fENUjE/QTrl7GE75aLnOFTekrSEAJ19Tq203LY3+a/BuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oO16tYxG/j6qjYE7/Lk94eKyL+WgFynqYQ6ok883GDM=;
	b=EQDFSqfL28oRFUp4quhwtVKJOcQyqbFkJ+FkDXwhV9zcl96LueqZ7erIX8cK5bySp4jU
	 F5RBzuQJowEcc6qbAEmvPkAzXQBVDZjOW1PW2GmzNRjZQSCOikknxsFJkti1ZMeaUwmtt
	 XA6EhVlrup6WLfedAgacMwJYKi+r244lQSehMpXrJnaLIj7iIKZSAkqRlh4ML8Db37wVY
	 bcCnkMw9rq5cnOQYv/9TemWNnBJv2qbpTvyUY2x/ztLT7Drc3/7XoWhfJ8ci8wm9sdr3F
	 4Pz+F67V/MOlBp+cKYAGGDxs290C4eDu93l3cmQSvUdfzRf1Dcl+wpZb9JqZZGAwt6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=CB1RAK+h;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC12A606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC12A606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=CB1RAK+h
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b19e291cc6so1724572eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890685; x=1794495485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO16tYxG/j6qjYE7/Lk94eKyL+WgFynqYQ6ok883GDM=;
        b=CB1RAK+hBV43O1TDJ3uk1Wdt7UA76x2jg+AoFoYcramvlyycXJm09lvfaBB3Brdp1i
         DTjlhBM6aLOW0f7J68sJu7q93geRVZoLObNnRpXnCxVoaGXM0P0UhFmhZT/V2pavjyZb
         bofXWtOoqOFIJ1Ckp99Qh53b60k0hPHoUayvMQjYcWwqahAJEXXxFjJfNsNffmCHMepL
         5cep+MgfklG5Zb4zqAkP0Psr7DP3mbZIr1RWXzUxxHB9OkGUSSCQ6DBKNcLz+OObAw61
         0KCeGDVwv58ZJFRcOZVUTOTPq2bz0eSPXmZ2O78t2JYE80Fnme3NwCzSvSpDr0mEy8D+
         5wOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890685; x=1794495485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oO16tYxG/j6qjYE7/Lk94eKyL+WgFynqYQ6ok883GDM=;
        b=sPKWi2H069tLKfUuIcm+wH/fxg9uV5nSnp18/QFo6UtLhlsCHHEiASsOLNEQws13Iv
         fNgasITPOLK5zc/lhLP8cr8PrYs8nDIM7Pifmd5t9pz6p4bSDIAkxmUfL4Tk1XkSzbdb
         dIkV+WjT6QUHB9vAy7+tIXYw8T1fqLZvpQ+bVZR6/SEugkevD+jkQ3hqq+bpzLBAqpIw
         ixa3LxROGpZa/5+UrqmooMhoq5wPawQCLevb75MHUCzKftTfAXePDARHLnaXJx8d64lH
         wbetwbGaHqL13BlpbIGQ+AXhBa2pV356IEGOUV/KGzXhCzB36aVHSfjZFWdbaAnJgb0G
         Pq3g==
X-Forwarded-Encrypted: i=1; AKwUvBzHZyxs8qBb8z8xyGZdg6ScRiBOMuktKJQYu99JR6mUlbSXAfGGdOfRl4hTkZ4uD3PZRNAKJbhpZCfx1hI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mxECO5ngO7+cU9om2xjgR6LnneyMjitsbkgbjZz2qUqvDNUfY
	gmIF/nDVdWq/y/3iEahAjtoVZGd9koKSldXfwumRQwqCqZQ+esgn6VNaayKHtBxWdis=
X-Gm-Gg: AYBFou0GoLGk5byG7tvnejHhNI1Zuq9GENaT08Yy9/xT6Ot7jf44jpGKOilA/4jfXEU
	gTODqKIBGuI/P6FvmpEcwmH6pvlnmdiBWKLW0D5jgP543u9KMm/cZim2TJf0shYskZSI8rOOmdz
	qtpWWtJqaoIKGRs8pjIGigZQwwJuTErYrPbx6HYS2h65JpjHutQ/b4h0dY8RTSyGeiVM25R19Zl
	hMS2CozQ/iWB1S1igoJ9x6jeclfOChEy3VDl1GVMX01p972eqNhx+3ieeYtT9pd35OgQ1bQ84rx
	Uaul7qljLWIEO/930ofg9GhnIfeNZKgZHB9WwsuBDbigB+M3YErAh40u+BEDMbLWMjPo9uS/TZc
	comO+Un+bqLJK9XEDIsH/cYRsj5GbYUBK9v465L8ICZ6qt1A7KCygfQHidWRIkhop4TImRwclJw
	rp4oPmyJtt0imCUyB7u0yN0I6VARgzGa1wQ0X8+dnyaiPuIep8sjdbcozm6pqoisrdc5iAR75mT
	mo9kX0aEFpJO5jTSSXndY4voSo4vmlmlbMMqQMvLJcOZD/jNIBDQozGZ9h9MWKYi4hYxMcFcNhP
	fkzKl39LHcMfwsoGfFsGSrP3K//veHBWnYI1Kn9yG4mJJA==
X-Received: by 2002:a05:6808:1813:b0:53a:65aa:152e with SMTP id 5614622812f47-5640ddca9e2mr14528848b6e.35.1793890685493;
        Thu, 05 Nov 2026 06:58:05 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6436sm4440554b6e.4.2026.11.05.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:04 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:56:56 +0000
Subject: [PATCH RFC v3 05/90] user_namespace: refuse setns() into a cell
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
Message-Id: <20261105-b4-cells-v3-5-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890669; l=1005;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oeHv9PDYaQdozIDgTp7q3k8e/SGqvaatRSU+LcY6LLE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKJ23l1/eRpiN/QFD6DBSyXGfgXNQ7bh2H4Pq7xCGtr9Qm3+8Q1dfH501o/Xz2gXUHThvaBpjW3
 pTNWleP3mQwM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A task that enters a user namespace with setns() gets a full set of
capabilities over everything that the namespace owns.

A task is born in a cell, and no existing task can enter one. Refuse
setns() into the user namespace of a cell. This also applies while the
cell is still being built.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/user_namespace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 9301d0d41cb9..45699a0a0bfd 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -1437,6 +1437,10 @@ static int userns_install(struct nsset *nsset, struct ns_common *ns)
 	if (user_ns == current_user_ns())
 		return -EINVAL;
 
+	/* Nobody enters a cell, not even while it is being built. */
+	if (userns_is_cell(user_ns))
+		return -EPERM;
+
 	/* Tasks that share a thread group must share a user namespace */
 	if (!thread_group_empty(current))
 		return -EINVAL;

-- 
2.55.0

