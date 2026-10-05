Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F149E478868
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196880; cv=none; b=FfAdNYdzet26bNeLXKY8nTBw4V3VUbfhTGCDYXscnMPUTyOEncyrCuJKgrXWwYbRTbzv8SItmXxKS2oH8kuOVy0hQMZ/RSqeLayJlkmEjw1FZNZeaBGSaX5vwSBAqGexnTt1pYFpdwyB1PHmLGV6Zjg9mlrx3FM8gtWcMlbUnu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196880; c=relaxed/simple;
	bh=BoHSRgQUQXCllKByP1AmPyfc8Ozed0EDclglO3qKZgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CoZkTa00Y7bDm0oxDQVaxhOIESTCLejij1Vm9UT0cS30/mVjBfzlYi0HjtiQ7POpa6/vcIRxMsrSFwIy4LhYsT+flnSPk4lHd/mpkaDdEdc0krgrya4oMKEoCTwp563tdsEN2d1qlrk0v6fNf2B9tVCsr2efSz50Dp8+39LgCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuEdQmZ2; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuEdQmZ2"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4932b13c4ccso629365fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196875; x=1791801675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1FtFpNk5R+wIzEPowvWYpW9JlGY9UNol4KXyc9/Oyo=;
        b=AuEdQmZ2ud+avbiOEMgwFUevjLumFNT8Xu7YOh3vjFkjA78HEmScIwTU1wbBucZnEq
         34NG0Sq9CAQ/m+s7xCnhccX/axA6jflaU88lOSXy0R9Ih70SnR4Zova+4sfBYSXpOKp1
         oVMcDG9uYlUYPu+/3CR4ltyLMdy4tgy6FESeL+XRWgk1Qm+VAKT8kf4BjgRjk3FtLbjt
         W4pBweKBCtVFGPR+Y4HeIztwL2HkrxfMMckI27QOg+2BMfDQ9cmJeDJevUY4iO/QPeCO
         yJ7ZBHD4JeiichUyNNBG5ArGx75dQSPkHxeZ5G1VCwfMvhZQSgCIKrHk2VhuncHwh7pv
         opRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196875; x=1791801675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1FtFpNk5R+wIzEPowvWYpW9JlGY9UNol4KXyc9/Oyo=;
        b=Cf+GLgVbBWDK3lRQo0L2MLYibXogfD6M4bS4Pk17/GZC+3COJ5iUSN3IvHMaB+nPmB
         q0J113/h32ExtAqEEexPkkx2hwyJYWlTYWObljLjwaTRmVG2pu4fQ8fJ1693pg7A07+6
         7tWy37/we1BIZ6aD9K9jz1Q/QeVjh+xR3+vZoFqCaZGfol5KegH1Uipvhr9iuKMWecoi
         5zMBUEMNOUE/QS2bYwdPyNlqW4tC9N6gfoDn27Arnmvbo5ouaWAEtJFC1SmZhwph6RfG
         YhJAiU25GRqXdiv40SQtHCFtfr3OcJp5eOq4NFVfz3so5ynXL4fDzHe3yghOM9H5W6MZ
         JW8A==
X-Forwarded-Encrypted: i=1; AKwUvBy4qW9Vf3TcP3GMvJ2jG3tKKOr9zXeo90fHFouXTVSg73UVt7nvpjfdmmp8K7HUT+3ypTOHW5nVdry8vCA=@vger.kernel.org
X-Gm-Message-State: AFuF++kpMtWpsmWCB1kuMPybFo1TnZzX+QXaqQ3KJEfDoBw0UUvwnnr2
	flJn38N07sn2TenOZdCClGm5g0BRvtAAHxKVIfjU1ecysxohptS4enMd
X-Gm-Gg: AYBFou2MlvlZlECOFPTRC8STO1TEW0uonmGzDFlBI6anwHnP6idUZSmGeD+fih+fQE+
	VpzlM6TJBc92GI9hi9PadyqqC1JU+erUGmWFeYmB4hHB3KOnRzwyZQSsZRujfcOqmZcL5WbYuc+
	vmOy7SKLW6JgcnzwJEwhpF68MNoB2q9PERqS7b6cnTOL7MbyEmivvDCoaRCHxptLRcDEU7ATBgL
	RrG2CDSLJJdq9RF/qYmC5PTO+bZ6s/1qWNgbUBjqRGbMXuiMOqROvDINwGXRjoj9/NjLFSZOeOS
	DlzEIncTYtP2xYTvhFzz1LnWnhR/xe2pQ+rnbh7faXutNc/pXAs1GeotMCe1ls0H1pHKhZRFH0G
	Zt0G2RbxsbmcT2BJigSosLSduEjD4gUCtVm2tTvnjTga4/A8f95rrgwhUx/v4nu0UHrW3QQZ/85
	QBKwisyrl/p33XrnKQJCvnUdCz6z5C2pAPHP9fI8RIIzOaWYnKmP0ZCDhpu0TA27MWlm4dhyrQY
	8Uo+QQo638y
X-Received: by 2002:a05:6871:726:b0:494:a2cf:8dce with SMTP id 586e51a60fabf-49e3a5f9b50mr5972447fac.4.1791196875538;
        Mon, 05 Oct 2026 03:41:15 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:14 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] modpost: fix handling of short reads in read_text_file()
Date: Mon,  5 Oct 2026 05:40:47 -0500
Message-Id: <20261005104050.1786222-7-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

read_text_file() loops until the whole file has been read, but every
read() call writes to the start of the buffer, so after a short read the
data already read is overwritten and the end of the buffer is left
uninitialized. If read() returns 0 before the expected size has been
read, the loop never terminates.

Read into the correct offset of the buffer, and treat an unexpected end
of file as an error.

This was confirmed by limiting read() to 64 bytes per call with an
LD_PRELOAD shim, which makes modpost fail with a parse error on a valid
Module.symvers.

Fixes: ac5100f54329 ("modpost: add read_text_file() and get_line() helpers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/mod/modpost.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b..1772068dc 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -143,11 +143,15 @@ char *read_text_file(const char *filename)
 	while (nbytes) {
 		ssize_t bytes_read;
 
-		bytes_read = read(fd, buf, nbytes);
+		bytes_read = read(fd, buf + st.st_size - nbytes, nbytes);
 		if (bytes_read < 0) {
 			perror(filename);
 			exit(1);
 		}
+		if (bytes_read == 0) {
+			fprintf(stderr, "%s: unexpected end of file\n", filename);
+			exit(1);
+		}
 
 		nbytes -= bytes_read;
 	}
-- 
2.34.1

