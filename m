Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F154199B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183959; cv=none; b=Ylq31aw5BhZ/s6tLv7Dkms2mj3CI2hACH+l7KX2XFBRe7jnpLTgJtf7xPOl7vJ27J6KYY+0XbfO3bmMjUNjBfLNxbYhf1bBN57QX17DKhXxW1KUSg+Ndo5UeXZRmkAnGIpweTf9dHAO4vw4ZZI7vrlutBjU1QJxgjVa8CrS1LLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183959; c=relaxed/simple;
	bh=JUCk/cLbhidqmM5D3jBlxBY8fMO1bXj3IZTST3KwGck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SZtC5FIk82s1yeJiskSm2yKnAcjUM2ctD65qLZFazw9qLNlG8xMCx7TNjvr1rLvLb4iXZv2LaLn2qRTRyLuxHLGJJrDKIE9fMIbU7EcO4NgsKeNXsVc/oM03uChJlmPE1gQ5z8lkwAw0PNdCivsfYUQFO7/OsaBosqgbTtNhgU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlAkFmVm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlAkFmVm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so3363545e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183955; x=1788788755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1QkCFEds/SVo+FCUoEAOKjVoLsCWq/U/WfbsaF3Hfk=;
        b=MlAkFmVmMbVAMpWRgzBlUA+wPdZx6orWBVL3vG11scS7ntzhxe6/ek1DpQDK6cGukL
         ZeAj+Gami3LqI1OMgmAMTquJrnsE8j2ur1iZNtTmu/P5BvSPW5GpX0mDmcuoWkzOFiQk
         JFEYiYqaGeXKrU8i6JGzN1CjX/loP2rqjgJdU0bahy1a6PBcq0Iy0MPbvB01kZWX7ft6
         22Darggbey/d7aoPJ6uv6fdUxC7X6nxCsqpfflY3HDWUtyV9Ptq/n3EfMz9i+BErXDvH
         cPsmPdXdC6y+2VXidGFAb43Wx5bOQBD/GaDcntNiR9eFfyLbhwwGqglQAGhWkzik6moq
         y8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183955; x=1788788755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1QkCFEds/SVo+FCUoEAOKjVoLsCWq/U/WfbsaF3Hfk=;
        b=ZdMb6ha0VMkKkvuqbMFi6PZkJg5FrzXx6cs2QXrFOLIafSCftCbXMniLRwzbVNJwrN
         T/7pD8gyaUl36oFZ0hIefTnXe+esj6qbY/DIuxVt0NbNWKSKmzitOd5R5p0qNEG4353t
         t9yuA2kL1Iw1lfOr1EW9stG2Y/rJe1RYoQSVBGFoV6dc6iaQuM1oXJQxvNbC4SDwppnz
         b+7aAinliDnAGqXcs6ORcckI5aGw44/G8NORlxKIHlHN86494UtojekBMiOt30aGO7Ar
         GgYiY4XEQm+53TbUYhAIErDFItHBla1torsOEvJrrpw5pXk7G0j5LauW7o47PjSEQawA
         M+LQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+5RkC2ydnaUN0wcIRAaTlvYef6YAJzAVq3D/8mTEa2oTse7VK67y1clY3Epgixe0Nc/BgUnLlzA63Pnc=@vger.kernel.org
X-Gm-Message-State: AFuF++nSwK3uuB7eFQNHowhG7E/bPTA6OXvdG6cDUozvWHITuMiFZB9n
	kQvrDfO0wfer9U0AuGVX1OF9iD/Vq6S8ivgXRYtkSrhI3Uf+ColaucP7
X-Gm-Gg: AR+sD10vTfu/BHJ9EJLeuiD0D1whFVsXgssrQpcc0nGMpqR81wVtP7xxdZKrCIUZBn0
	dVF7nsZUb2cXfz8QMh+VvFEpuahwX1iqeu4wNTLNF75DuyU2MmqhNfkw6oVwrW84VDraWw1v9Qv
	fa3wKIG1xgrNtpyMwlgcTn8T1gNJgIthz1TF3tfkSdk27TN2cRrIIsiuBOj+B1Zsy+e9THzfz/k
	/HtAVmtr88f0FnSYXRutLx9zKtI+B9n57W7uE6Mo7T7lg8nqC2oewOQ13O93XNJbPZ1TF5Gv5La
	xCyjg6klOcXqEyrSYYFuHFSonq4toPvBTeYuRc1H0w2sKgHCTVNgdF5knIqm5PnhbeFdW9RAHaF
	I2SsbfeVhlcli7xYcM/bJhESJzueHtBEooL3ZRTYMOyQH8c3vR9d37K/CZdDzKSDHkWeiAgEb8g
	40IktXOER6qAfpvnLydGzdRFTpQ77asBquS0AULWWQjKugt1E3DgG9hRGqVWiEw7feC/IW1q7q1
	g==
X-Received: by 2002:a05:600c:4712:b0:49b:910c:76fb with SMTP id 5b1f17b1804b1-49b91c4567dmr142503895e9.2.1788183955116;
        Mon, 31 Aug 2026 06:45:55 -0700 (PDT)
Received: from debian.home.arpa ([88.97.179.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b468009f8sm382530045e9.0.2026.08.31.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:45:54 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libbpf: Fix debian kernel version information parsing
Date: Mon, 31 Aug 2026 14:45:37 +0100
Message-Id: <20260831134537.1227914-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently get_debian_kernel_version() expects the version to be in the
form of x.y.z but the Debian kernels uploaded to experimental are not
always LTS kernels. Like the current Debian kernel in experimental
is 7.2~rc7-1~exp1 and uname -v reported "Debian 7.2~rc7-1~exp1".

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 tools/lib/bpf/libbpf_probes.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf_probes.c b/tools/lib/bpf/libbpf_probes.c
index e40819465ddc7..5acf0f84a40a1 100644
--- a/tools/lib/bpf/libbpf_probes.c
+++ b/tools/lib/bpf/libbpf_probes.c
@@ -62,7 +62,7 @@ static __u32 get_ubuntu_kernel_version(void)
  */
 static __u32 get_debian_kernel_version(struct utsname *info)
 {
-	__u32 major, minor, patch;
+	__u32 major, minor, patch = 0;
 	char *p;
 
 	p = strstr(info->version, "Debian ");
@@ -71,10 +71,13 @@ static __u32 get_debian_kernel_version(struct utsname *info)
 		return 0;
 	}
 
-	if (sscanf(p, "Debian %u.%u.%u", &major, &minor, &patch) != 3)
-		return 0;
+	if (sscanf(p, "Debian %u.%u.%u", &major, &minor, &patch) == 3)
+		return KERNEL_VERSION(major, minor, patch);
 
-	return KERNEL_VERSION(major, minor, patch);
+	if (sscanf(p, "Debian %u.%u", &major, &minor) == 2)
+		return KERNEL_VERSION(major, minor, patch);
+
+	return 0;
 }
 
 __u32 get_kernel_version(void)
-- 
2.39.5

