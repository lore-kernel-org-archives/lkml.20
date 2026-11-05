Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892260;
	b=kfVJU5zDl35EYSb0+thDs+mW93MCYVSjcWQQxfTGnBeB47D/DlzsvOyV7gQSmOCf3fZf
	 c3r5pV29n7kQB6DTGZT8NBX61OZ4LG3pNK1lnFmuR8cUP1erUGv1I0F04cGec/GqYW5Hy
	 pT2pJ+LAcvRiQbncVAewAvNHKBJc2Elu0EezYmIXTf6tGSNHHS3Cxb1XUFc+5GIFgy/Kh
	 PouRRFB4pcvdy9ZAW2GKDMryuDrNpXbaDNCtPSAL1z4UoAxVwtnjeRcy3nGvWVS+wwSFI
	 tbkB6T7MQOXZVMf/JhqPi/1G8QIKgtRrogaN4RaxyaxeS20MNDbT84OWMOvTNPfKdTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CgHGWEb9qpoDk/IyVDhvoOSLBvsdHKyoPKqeM6nD2fs=;
	b=fHAU6UOv0YheTYjAWZcmuSsrC98S1D6DTL5Rjvc4o+v1h7rtw6vJLqDF4z0pGOA9xR2q
	 hZqA4NR3K97WGiM9IfjQ07VPDrrlNSjh0lti3si6AdBZthN3irBH1dnJpzDeVE/PzVJkm
	 3qeBTN2L4/Lu9fQRsJdGd9VyWnS3bvF4neG0+h5qL24BXEaAMNc+wAIyvAtTPsCOqdq3X
	 MNpgsUB2dNaDAQGgCFHeyD5nVYgy5LxqC/+uajBBZe4r9T1MFOPxa9L9OYFK+vj/OmWYe
	 c414krkfNgrsicTvEiBBJcAHZylgfidsh2/dWeXYrflD9T2x7WWMpAK3C37RjtlmYRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=W5OmI2WF;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7DF606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7DF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=W5OmI2WF
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-945e6d9ceeaso59587185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892259; x=1794497059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgHGWEb9qpoDk/IyVDhvoOSLBvsdHKyoPKqeM6nD2fs=;
        b=W5OmI2WFoOrlPQaQlqW7y6prTDYzYnz8LXlYBfGdlxGrZzyVtKZmJ/tYcn8cw1ovvD
         4IOeCgsJg2xYdI/Z4xT0aA8AohOBoorIOgSnXak5YKCBU3ReOLfYVYjdx41p7OXBeH+Z
         7we7zHkKc+2judyarmVw/Yz2wj3rNGBoaExaCZqC7+qDS1upN781DJbc22xHgiD6Mgj3
         UGRdmz5SWVNOlMYweKQLRFa92qwjxj1qGPghGwxX7lVh6X1SKYNvXjQqaJaqd0NyGtha
         DWhWH9M4sCrOzXL2XaKNohgNc5OK0KJOkh/t9C0Yxd6oEZQ8DvqPO3EOjzlNHWx2DI8t
         P1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892259; x=1794497059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgHGWEb9qpoDk/IyVDhvoOSLBvsdHKyoPKqeM6nD2fs=;
        b=EW6O4xyhnIGqd3dWdTkoDXPwvQZJcZ/SbL0QOhw3cPpQ7fm+VlJzG0hWKaaow+MpGj
         0bJ51ogYypWKq+IduzoCAGeBMA4sAoNujjH47svgVowU1YHvuCJQiRv+DC7FIj677NRh
         6HTMSqBSMWsF/u1ydjtyCxweei8xCy1+Kixg64tlD1IXqHwe4AzAsiZKSLxhYaFMK1hr
         6ijAhLLaur8xrT2FfKVFs9OYjaXdwgJWz3e4RIWG6kqClPBJJSTIAQ2wpIX4casLdnmM
         snBAYShbmaN9OdjC3dPYSSI6xIutzBPqTrsjPfevP+GCcX6mSUrrjgByp+P6AY8YWpLa
         FHxg==
X-Forwarded-Encrypted: i=1; AKwUvBy0zxDSRbQCe0nAv5G9mLzmkUw/OQk8hU/C59Hs3wFg4SbzQh0LJA62N7CJuiuAJEELaNLQg0xTHMUhn74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/heCxwPsSNkzTj9xEtu0VOK+H3g2Y6DVGdGuTmgZ2w5GF0HgZF
	awEu6dmgiLIKHjeVJhr/JyloGZXwdMaVGhqg8okKPpcGFHOjuSil6ZE/rSMucGC8+Qg=
X-Gm-Gg: AYBFou0KNlKwZU3c8Yqk3JxXaZYy6Rvdeh+v00bg2XqdhnoXFwjBjC0tDHx6accAM7M
	8qWtbVHg81dtkU4hn8Q8P997Ypc1DHSLw3kuKDaPuRH+ElMQ5lp2laJGdHSTteq0NceG+CI7A8F
	o/tRqxjQo06is1F8VWOZ+bWbLWR1F6jUQbqBycPBilE7Z0u7U81uBaUS7VX//SV8Krrtmcwg4uy
	KK7Q7vWhp7YEz0RPXURKcMh7l3+rRmL2c84nxudl3SScdNdCU16U1e/u10/bhqE+K/80kGHoINY
	6w5OtaEhJCY3TdUVJ8Vh+PhZG/S5+WAbUj9N4m7fNyFo2Tisxu34XoixYqIzJQUIydQP0h3EArF
	j08du31cNp880Fmvz5jeL9p3ysXBUzzsVFjQ0cf29LUXQfn/GfwqaHRLre9S5HXxPXJMaHSokkZ
	9gKGMDc+9LxSSteXfbKB6cm3bJRBzgGjKu7wqgej+VeF/t6vnwZn7qtMK1xOaeobokujI1rtdf+
	MVLosq48c3NknwwWW8iGU4b/tGWdwjGXQVbhbjOzdIxh808YpVHtcSyqDmcBRYivLF/mSr8CeXL
	sTEiXGZQocK2w19FfIdWiCWIGZrpKJMsuuMgP+cU4sNx
X-Received: by 2002:a05:620a:1d06:b0:93c:7f48:8f46 with SMTP id af79cd13be357-944214d0ce5mr3206665885a.4.1793892259411;
        Thu, 05 Nov 2026 07:24:19 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4799adcsm484751785a.13.2026.11.05.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:24:18 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:57 +0000
Subject: [PATCH RFC v3 65/90] capabilities: take nothing from a file in a
 cell
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
Message-Id: <20261105-b4-cells-v3-65-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=1657;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=D+Cdq2T2lPlQeYvKpvG0Sin8qjhYqa+M0Cqy8B6GRBM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ75FP5at3MtspptwDZZtymvVqWbz3AfoOVYDHJb/KXuaVKmb9XKwBI1faFkJdsgbaOCx4kPANF
 W0BUytw9RGAs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

File capabilities with the effective bit set mark a program that does not
know about capabilities and relies on having them. If one of those
capabilities is missing from the bounding set, the program is not run at
all, and execve() fails with EPERM. This is why ping does not start in a
container that was created with --cap-drop=ALL.

The bounding set of a cell is what the builder named, which is nothing by
default. Every task of a cell also has no_new_privs, so whatever the file
offers is discarded later in the exec anyway. The only effect that reading
the file capabilities can have is to stop the program from running.

Do not read them for a task of a cell, as is already the case for a file
on a nosuid mount. The program runs and gains nothing, which is also what
happens with a set-uid bit in a cell.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 security/commoncap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/security/commoncap.c b/security/commoncap.c
index 8af343c78d35..02e25ab18f56 100644
--- a/security/commoncap.c
+++ b/security/commoncap.c
@@ -777,6 +777,13 @@ static int get_file_caps(struct linux_binprm *bprm, const struct file *file,
 	if (!mnt_may_suid(file->f_path.mnt))
 		return 0;
 
+	/*
+	 * A task of a cell gains nothing from a file, so do not look. A file that
+	 * insists on a capability which is not in the bounding set would not run.
+	 */
+	if (userns_is_cell(bprm->cred->user_ns))
+		return 0;
+
 	/*
 	 * This check is redundant with mnt_may_suid() but is kept to make
 	 * explicit that capability bits are limited to s_user_ns and its

-- 
2.55.0

