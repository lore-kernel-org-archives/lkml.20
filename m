Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510197;
	b=Ljt4MEXCApR8NHClPZ+9zuf1vToab0ooHw0xq+RmHq0g0RaciqnwEElzdZNJOQNfGXzc
	 CLrRTKdlxaIKNRsEO2GPaBwl893BfilPDnkiu41R30JjdC0HWg3Adsv8kOEvUCnTKyoZB
	 uTTS80pKDb4zMWMeGOfWSUGCWx3k1/7PE3f04L+qhSYY5TmCeiCIhLZu+EondGyGWXemN
	 mrMwfxB4+VfY8fxt5h6DpghkZ6ghDVXC7WpEdwTKUSCMBoSULojByD/RaPvagn/cdpwyq
	 YX4I7sXnEbP8Gd+mq0U2gwEj7l/IJ/TrotCmNWk02gTHPVCrg62AVcEh7pNINHYpJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AwtZbG8vO3DXJZ+wf2n/OXaUiA7ZcF9VhqYp22ae1mQ=;
	b=xcvPdf/U74OZIyMuHqUcIGn3t3lIzJjWRk2FAKfaukFPUuJefqT/kjl5fsp5rcfCItXO
	 1AdmR2kteA364UJxDz7/GfNt34XE/8MnRhNpcVIdlNkoKX4nB3jR+iHU4YJDbMV1yvY7K
	 CTMRMyfQYdK1Ny/QhhgMTN/NeVRed7VsMuQgYlpCjp/UjnIrUn9J+IhKR2bG9PvdrzZP1
	 TiFVIjced8TUTsrmp0QLGpAU4nsRh/Rx0hC0lokZDIcTkj20w/ArKxHav8e//VT4XeQKi
	 CdUCrLM6/cg+O3S1blA9S7ij+W+el95j5w6DNnyQGExsSnvlHJIXQz5LJP26/k6PWQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6K3KvvQ;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844C606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1844C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6K3KvvQ
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-35829219da8so1098130eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510196; x=1793114996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwtZbG8vO3DXJZ+wf2n/OXaUiA7ZcF9VhqYp22ae1mQ=;
        b=m6K3KvvQnAHr5qGckwyENo1Pp7eO8y5rm8I+fX+CWw2v2Kuk9n8Hz93VUmfMln9EOp
         2nDtQkuBLTk2/MgsBteLOEc8jlcL/ZllHHOyqk5kpP2VVBNNWFEyv6C1iB326GI33jRC
         AXqKNhLi+/S21j5nGBUqbDZEJ0ri1nZ52pwfhJ4UOU+i+ToxutPJcoeKwGs3dj6KaaNf
         m55OvAzWqPI0jbbvfEUkSxKR9j4bvx9FAIVVaqLBSCvN1X8BcUR77gx1tb3aWMVZ+ovj
         QfZVs//QJIkQJzWpd+HSG3t0DeojSkr45y/0gwkv9w7Sri5VC5eL4TjecIHYFpkb9KrV
         bMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510196; x=1793114996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwtZbG8vO3DXJZ+wf2n/OXaUiA7ZcF9VhqYp22ae1mQ=;
        b=Wp8XQivI3sCAzqdxdJBekbjZVU7Bvlx5BOOnzQJJQgf1MquljtYrIN6OlJ9fTIRDQm
         K2R7MbCuqeNPGivI3+0tmUBTfmYtDBRH4eDPFXKNqFOXemQZrxVdS36PP05kSTdrwLEq
         6Ns4fV0Wgdp8T6fNBMWYfWbGA+iykt+1I1Mg4LmPLNgtymO+kKgXhOKAlbGViLcHyeBO
         VVDKpJJ5ZqJExaFqShVhCrGdlDqFXoqIheLEpBPVGhxrl3PuyXJqYXhb70j/coMVu+lL
         4Djk7wsjXNjrzz3dDf2IYB4or2azNyd+Da2J7uaB5zxcaR4LobycKjlemDJHbU4XCiTr
         dSmA==
X-Forwarded-Encrypted: i=1; AKwUvBzeJ2jSzqX9xF4LIEntstBw5Pe1cCW8QpV4mOhuaj4Si0B+TSUTplmUIREPKWYyHbp2qh3W3eBBo+mjAWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHjbtwe4gfKmvZgvhI2ISSdQMeiW4Lv87/9yE5mp3rat27lf0J
	/xgPLUbhFttmgI89I3Nvhgr+3bT9TF/L0aavO9G4Jjf1vwzYQtxdJvR6
X-Gm-Gg: AYBFou2MnEwYHkq/tjl9iYzcGAAnA3xx1IiRkmiq9oOXsLfpzWraoGzdtcrSu8psA/I
	HTNPeXjCNWWwfk4v+z7EMZGo25mO96S7TCjTYhBz+hHCQ2YUILhdKXeDjm+ej06Pj6a9/zDoGit
	4ZlreBwpNs81kS22twRCkoLHs9QY45+ih2wEmKD/ZcI40/ORRiFwemvx2lYkJZuwnVvWxhTf8pJ
	x13ohjXAUQ04KraC4Eoti1gwsy1jTv+XYoedSGWCpPHKfHq+VLk/09T+eO63VjdbpDvMbh+z02/
	/vN7McJoJRhzM76k2w3pvxtTNAfi17Tc2IsLCG9U6s4S4UPu5oKxOoen+N2DAlTbfQ2Tb7ygS5x
	Tc+bs4P67tpocIyTjHGWaU0R8YTeU42tehg+9T88U/J8c/QcbZ56Eg/k69XGNYprPG9AskWR9qN
	QikUtQ5zsc4V0TxHZK5fuJAhUMZlg4UhD6w4AjlAkSrIL7Inxl39iolJHs0toQDk6ohGtQ15j3E
	2tBBSjVQLfd81rFGX4F470/+w==
X-Received: by 2002:a05:701b:4210:20b0:159:f192:5290 with SMTP id a92af1059eb24-18dbf218391mr3033361c88.13.1792510195920;
        Tue, 20 Oct 2026 08:29:55 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm44074019c88.12.2026.10.20.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:29:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Joel Granados <joel.granados@kernel.org>,
	Luca Vizzarro <Luca.Vizzarro@arm.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] pipe: reject oversized pipe-max-size sysctl writes
Date: Tue, 20 Oct 2026 15:28:57 +0000
Message-ID: <20261020152857.48989-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On 64-bit kernels, the unsigned long sysctl input is truncated before
round_pipe_size() checks it as an unsigned int. Writing 4294967296 to
pipe-max-size therefore succeeds and stores PAGE_SIZE.

Reject values above UINT_MAX before narrowing them, so the sysctl
handler returns EINVAL without changing the stored limit.

Fixes: 515c5046650d ("pipe: Pass argument of pipe_fcntl as int")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/pipe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/pipe.c b/fs/pipe.c
index 4fa69192e6fb..5472a687ddbb 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -1566,6 +1566,9 @@ static struct file_system_type pipe_fs_type = {
 
 static ulong round_pipe_size_ul(ulong size)
 {
+	if (size > UINT_MAX)
+		return 0;
+
 	return round_pipe_size(size);
 }
 

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0

