Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892412;
	b=C5/ZhVXs3afQkjIuZwCJRsAGtIIZi++wpxDMCmMmuEcdUJgA75+IyOCyz4bOC1KWz9sc
	 TYgZnnAUpPpjblbGnUmOLWQe+hXHvubH/7aLgIj4P+RVdAoXNJKT+1H/NaG37G87Zu1pW
	 mmi4ASXqlvYGHYuHqb0XHoJdQLOyQkoQeH1k05ThULG/p7VMHk3SM83fP4ohfrjMzOFi+
	 3ovqLohaSPaXctZfL4m9OYTQWXaqxs10DwhGs59WJEx9kZ892WyhDrvJdeG4qrXzasPd4
	 fY0f1hcfEqxstfa1yLsBcSNi8wiWGBXYFV+E6SD43Uof8YwaVScpJQNTlFFhKRrCztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yvZcI1OHvptU4XKngE+vPkGgXMoqOQWT6+3hFUnC0vo=;
	b=PjCo826WSOaiN2oy6P2iGq22T2gwFPTPnEVPzTjfO2UQ419WJdsB9Z52v4NP4st1cLMK
	 hDleutPXSLr8WZBzjjZneJVS2p6PGNKaF0o4a7qCaEHiSR07/P9PA4ePSG0ZV3VQ9cMfy
	 qqZIqzO8GbnANGsE6JN3uaesS7cJHIw9dnPpwsCqBfHNAQaag718GhtLm5avEprvFbc+H
	 IO2SHPgTO/Pri8AdlStXFWTB4NyiEZf9wZ1QORRvKr5WHdw46eyKJ3IrYtaXDo/SRmSQn
	 Q2EHjGrAphry6pMdJAhGQ0+mtisqOqY8DRMk4uZ2rnF6noO/q2wYepZdjFWoJYahh2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="pk4W1Xq/";
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E054606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E054606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pk4W1Xq/
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91befbcad6dso23810666d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892411; x=1794497211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvZcI1OHvptU4XKngE+vPkGgXMoqOQWT6+3hFUnC0vo=;
        b=pk4W1Xq/MxbbrDdZkB98M+dpWr6t6g2F9KY03jGQa6P4pT3bfHqtoHts6Ok+J83YOZ
         xcByhrUYXlzN9aP9MriichOfvdcwgypm8Be9NnwqNoNstD6Sv3XngSB1pg0W+DrQ9VNk
         i51VgtNr4M+u3qBaqBHc9y9EX1BL6kxX66FZN0G0eq/aO7xdlj1uWGYFdjPASEgRGUzX
         GCKZ3ekZmd43Xp9bD/sajhlX2mm5fU4KRwF5kt4/gMS5jZO3qJ+/7Mky1xON+6Ne/wAq
         cK9QuzmLWaB129g0qaHdHDOL2yl6kfS3yq2YofBtYpphIFbDJvrSLEnOY3qhyD0ytkap
         R2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892411; x=1794497211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvZcI1OHvptU4XKngE+vPkGgXMoqOQWT6+3hFUnC0vo=;
        b=AsWvAqQoHeKRcInHKUn6aPyfBY7AMQ/OGWaZwTjgtOB7mHNUsHnjPPbUFhAbMpIb19
         vg4XqxbFqeP5ihzcP67mkYrGPGMkrwBQemZO+j0AIs/JFWzkYityDlz8RuK+bp/A5vkW
         9otXObodsE5UHV9V3vnPl0e0jnZ+XCJBgxF1/VTLXJPxFmGF/DBGQHx53srVJHapctox
         Xifsm6WnZzAgirn+QKI/ovtmdSH3D7lZp+prEDfdZwbfjuNeuRekp7RPvhRjYBWH2b6A
         CMzyNberTmtOw+4gg2fsOwr1274kV6j4MTModpZlZjm9K1oAYv3VidYnJO/VlVWPT9KD
         LcbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJkgNmqaP7k8EJ9rKTIsChCjKAcjw/wcvtrhoDg2wZveBGUGfCS1/GZfyFoJYpmUmUwK9JvrLdhXkYCAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wGaq+4x2+fzQI9Zf3IH5r3wJQeJD5s/+NeeSuPscFNaUxgfjb
	2WFcD+QWVHTPaXHeogeq3XyPpRp+R7f6GUB7EvhVnH41PWwcsvgJqqF0TlnicjANWp2Eg6lpzqH
	QL4AbLliHGw==
X-Gm-Gg: AYBFou3re6BOF794RQKLkY0QFc4NKS/dsXhNohCVjUerpsJXBJFlAmyeaEGDNS0KPoq
	75D67N1kGN5Bebh8RF4LeQ96AEVSeLIZTJs0z1SM0ZzZPknk2j6m3EbIGu+1Uji1VbE9Ika2v1y
	LrpjDnwi70hGnut7mU6/PVIv2b17ehTMZU5IohbSpnud7iPwnErs8wQdzyuuquFdOkNCHwZ0qJ9
	Cwq9AlAv3fRmvfXJ8uC5uQW7ZxuLiLobtihsHh1JxOmyAoyHHMUheKdy5nykzgxAVAO+s2cIIVV
	DmStNroAzZ3Av9A6wcsE0D+TDhUsxnD/z6Dbk+Vzb/YiRm4Ltf+4EeECNVTAZibxzX0rsl9ihAQ
	Y3WIJWQd0IVJOwvr9FLkguGdqO3gHU8iqdAhOO5cNk32ltaqgKBOBm3ZRimJFqA6MwlnpOEV0DU
	G8hhVAdilflgbv28agLvl5kB5/3WxKJQf03Zf0HhR0teKmtzU6qHUdFRzRx607363svIbVYB5ED
	9AuXK+gv9ZR1Lnzz4/oCQJdE9RogLyEYybkBs2vv4aKrPpST7+cH5zjTD5w+7XGztnBTzrXDcJu
	9va0mS9ocECSJom9nghbJXQCXJPmPF5aD2TQSP7dysA+8w==
X-Received: by 2002:a05:6214:d85:b0:91c:6164:af7 with SMTP id 6a1803df08f44-91ca4b24b3fmr316690256d6.29.1793892410612;
        Thu, 05 Nov 2026 07:26:50 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e013f13sm49939286d6.26.2026.11.05.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:26:50 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:04 +0000
Subject: [PATCH RFC v3 72/90] coredump: let no core dump leave a cell
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
Message-Id: <20261105-b4-cells-v3-72-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=1714;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vsAAr7xKPl/M++C3sIDFJ1Y3iQg3sutN4v2VCmqUbEM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCheF1tyWQhKCTVCe18pjch5byqxfWFHdE2AolruBYMFlyUSfWizLvNPvbmapwT0izrRm3Q0Y42
 uVRLFVC6lpgw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A core dump that goes to a file is written in the context of the crashing
task, with its credentials. A core dump that goes to a pipe or a socket is
handed to a program of the host. That program runs as root and parses what
was in the memory of the crashed task.

After the previous patch, the helper at the end of a pipe is no longer run
for a task of a cell. But that is treated as a failure and logged every
time. A socket is still connected to, and the task then waits for the
other end. If the listener does not answer, a cell whose init has crashed
never dies.

Skip both kinds of core dump silently for a task of a cell. Whoever set
core_pattern may not have had cells in mind, and what a cell hands to the
host is for its builder to decide.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/coredump.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/coredump.c b/fs/coredump.c
index 82ef9d115999..6b091807aef1 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -17,6 +17,7 @@
 #include <linux/key.h>
 #include <linux/personality.h>
 #include <linux/binfmts.h>
+#include <linux/cell_ids.h>
 #include <linux/coredump.h>
 #include <linux/sort.h>
 #include <linux/sched/coredump.h>
@@ -1210,6 +1211,13 @@ static noinline_for_stack void do_coredump(struct core_name *cn,
 		return;
 	}
 
+	/*
+	 * A file is written where the task is, as the task. Anything else hands what
+	 * was in its memory to a program of the host, which is root there.
+	 */
+	if (cn->core_type != COREDUMP_FILE && userns_is_cell(current_user_ns()))
+		return;
+
 	switch (cn->core_type) {
 	case COREDUMP_FILE:
 		if (!coredump_file(cn, cprm, binfmt))

-- 
2.55.0

