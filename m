Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525300;
	b=N1uO/zveZbC0vekYof0nqkpCkomrtIlpgG8/ymgVpEtivjnG2fh3iOdK0lYCML+JHmBf
	 VwJCCRolVi/nekAwnZIUh50xbb9vORQSg2UVKRrJsf9amEmqgNqJBbO1YaETnkzJ4jfwf
	 JLk1+hP+Y9XE1Gbd+ahyWXYNXbfZly6fRBvtYGVAK28GyFRHRVRoyHuHpXuWW3at+sVlT
	 tZtdOeHR3rNOCFRS32HCj8fOYbvZm+rCdyBlpLzEH4uSas576S9EPyxVOVoI+ZsIwceRy
	 g1zrjzvxsuW0GQ0ksGWpnyfx9xhW2W7vRTg3eFlpdV5/ZJndFvm0YbmRnWBiEYPGruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525300;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=IDpOMWhvYKOjAnThywjKu9/+Z0RvuBq6iLA0jjyKXbU=;
	b=T5pJgXjrZ/cZOf001bWtqD46nRp024q0faa4j36G3w4r6ExXICWWjYcZXuSWa+QikiRc
	 bsylYK+rquevosRPGHOcp0IzNIcVv/Tc/qiUk/R0R7NJVqDhBE0zwt73f8VioEoqaHe4F
	 oHopWRWZLVK9FA9EBfN+H4fwNORzY65lluYx0NIpxmTQ6SxFX63Fg5AUit1Bcx6rTde9y
	 RvtxWQv4TOjPi9bm5FaVOz80bK9xdRmOC1JyCTfn51OrP1cpUIPpgiP+CW6AK0Gbhhvj/
	 XFPyISPsdavjYJw75ei0O/zCxzg8KSBbBqBv/0hF+R5VTCv2rNumN8ww1BgOPw38lHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=u0O60poT;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=u0O60poT
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-845788309b4so5838a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525299; x=1793130099;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDpOMWhvYKOjAnThywjKu9/+Z0RvuBq6iLA0jjyKXbU=;
        b=Sv1IHxcYYathzToGpIVPN+RrOUCEeH9Ir7WrwV1qtNjOmKN6mbUCfcqSLwD/Aq7+p8
         zaqnOO4tSWQUQ6M52/XY+0j8VSCZvZUadtoYZeo/0zYWVtcuqCptVAXpNcSqBvt5ALED
         mxmRGHPOR/6NZRgOZ/TieZeSjcxtWlwPMPM1amJPzWrP+b3Ix7Efvujt3YwpRrbgM04X
         c4W3u+vn1d/jLlo6M14LxbhDt63/stgzKBdyrPR1JSID/DvaOZmRzokgCgQc0iUtthRv
         nE5IHZ1ElKpJOr2qQsY6brkszC8lTXAY6sX9sObl7kp5awtA7svaLNYwuhLol9hao1/F
         nTDg==
X-Gm-Message-State: AFq9FYJTzEK2KQTBq6Y+4+pWaqYVGidW++AK/FyY3fvYd6HFz/ZWalLo
	Lkcg1x0c6UsiPj/77+cEdopnOcnsd3Hzkv3yT5tvVn/25bXGtAdgbceW
X-Gm-Gg: AYBFou3wesJ0eBmDMKNodNHQoEGESVn5DuwWfrzrydttheJKLwQD3MFuvWu/IGwjjwi
	K5c1RlLJkEnnKkRoV3gm1BWfopCFPKLClPRSGlLOYiAalRbAQ5LiigCa92AgQPxsqp62A+Z0h+A
	GRl9lV76bt4XFVCHWb1D5F6I4jrmd7qYa3n4SmfG5KSjsNfaaRY4qBPnBfnVNdp54mPpRNnVPW3
	hdC0ryiOBESMIICT9VPJp5iSjg8e/7Rcj47Afr6TqdS3l2M65y2U/HN/s/5U8xRdSgz2u0TDLG1
	3pe/pEk47BlumI8qJ7hfiioVQEkVs2Y6ALegKmKxRDibzHJSV+DYMpxC5Jcu199kmsJYudU620P
	RKT2l9+wUfYd3DuUvd8Neva24HolyjF9UhS+0KjUcwwUDU5QpMfbAHwo8rg4nZ/4eer9jxZGwIv
	ZBTEpwQiAEkSD1+LAmJGSZ/TsbTs1jx5Gu+90c8Fdk5MHPwe4XsxjSiwLNplyxw0ZUWuBj2AIsS
	dk6bEY47CWj3QyzyoiicLe9yTu8+4lyutvvekhgAcVemuFfC69kSCLy3R0cKEbPPrT0Qw+X5gz6
X-Received: by 2002:a05:6830:3c0c:b0:843:d5ee:5785 with SMTP id 46e09a7af769-8450114fe44mr13903378a34.12.1792525299024;
        Tue, 20 Oct 2026 12:41:39 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbc7d9c39sm397677a34.4.2026.10.20.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:41:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC267605ED;
	Tue, 20 Oct 2026 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1792525296;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=IDpOMWhvYKOjAnThywjKu9/+Z0RvuBq6iLA0jjyKXbU=;
	b=u0O60poTiVvmdHJpStdl8Zq+O5no3lkrroHxP4jtCb5VkNW+z0LmaQlRljgJ+cyQHzzc7u
	acE5Nw0rsen5j1W/JRfqLE6IJH0GRo7j6/h9kKmrKJn5PtIhM/CpVqQ4dIQqTOGVCCcICN
	0b483lzb79cvNh7POa2zzSKVw3RRbEZNhPBDphGKZN1ayYScqx8ewwVK5eV1P4i+zlU3QZ
	bFDKQ+tQegfrhy+gMZsynfGWAIieOwkI5HSLE64LEbCqhnR4AhqVAn6cBqP8S07iTYIg+g
	rQEYyJQ+FDBjoBNsW1KoH65S5hnLifh73fP3iVMpTUPnsJmYsJv5YBehgTzgcA==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 20 Oct 2026 16:41:31 -0300
Subject: [PATCH v2] ktest: Accept quoted bad term in git bisect output
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-ktest-git-bisect-v2-1-1605122620f3@marliere.net>
X-B4-Tracking: v=1; b=H4sIAOrD12oC/32OwQ6CMAyGX4Xs7JTNBcGT72E4bFCgKsO0k2gI7
 +6Gd9PT1/792kUwEAKLc7YIghkZJx9B7zLRDNb3ILGNLHSuC5XnlbwH4CB7DNIhQxOkLSvTmZM
 uzRFEXHsSdPjelNf6x/xytxhNnpRwlkE6sr4ZUmsi7NEfRssBKM0H5DDRZ/tpVsnz5/ysZKxWG
 V12ReM6cxktPRAI9h6CqNd1/QLI3gkP5QAAAA==
X-Change-ID: 20261009-ktest-git-bisect-a894f472843e
To: Steven Rostedt <rostedt@goodmis.org>, 
 John Hawley <warthog9@eaglescrag.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792525293; l=1709;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=df47vrq7dkwE0AjjlYUdJrweN6GuCI3+e6pDYSsrFtM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJxdpTUghodnqBnJZtH2sObuT1JTm4e8eClrj357PczcszvhWqMJjWz93T/L9Be7OsCIUAV4xPy
 aXLwB5ayHkws=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

Git commit 0c0f93e7fa64 ("bisect: print bisect terms in single quotes")
changed the completion message to put single quotes around the bisect term.
run_git_bisect() only recognizes "is the first bad commit", so it misses
completion and continues the bisect loop with newer Git.

Accept both quoted and unquoted forms to retain compatibility with older
Git versions.

Link: https://git.kernel.org/pub/scm/git/git.git/commit/?id=0c0f93e7fa645c1058226a9bfde9e2b4441edf96
Assisted-by: LLM
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Changes in v2:
- Dropped '(?:' usage
- Link to v1: https://patch.msgid.link/20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net

To: Steven Rostedt <rostedt@goodmis.org>
To: John Hawley <warthog9@eaglescrag.net>
Cc: linux-kernel@vger.kernel.org
---
 tools/testing/ktest/ktest.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index f94ed2e98887..5bee1c9a351a 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -3019,7 +3019,7 @@ sub run_git_bisect {
     doprint "SUCCESS\n";
     if ($output =~ m/^(Bisecting: .*\(roughly \d+ steps?\))\s+\[([[:xdigit:]]+)\]/) {
 	doprint "$1 [$2]\n";
-    } elsif ($output =~ m/^([[:xdigit:]]+) is the first bad commit/) {
+    } elsif ($output =~ m/^([[:xdigit:]]+) is the first (bad|'bad') commit/) {
 	$bisect_bad_commit = $1;
 	doprint "Found bad commit... $1\n";
 	return 0;

---
base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
change-id: 20261009-ktest-git-bisect-a894f472843e

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

