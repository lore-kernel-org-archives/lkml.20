Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616457;
	b=V8pPr3+dDiF7fOzHjN/LYi/CovbUXHGr26eZXMa2L9AD+CYrXyYnj87hmAIRz/kn8/oZ
	 Tn4Grum5xR2sZ1VA+nJT0aQWsGj0nokpbPtbWxDMeogenyffQkUwzr7spDlcLojXznuV+
	 M3Hu9H5vTVTM8vwk1C2PSfYu7XgwaELAzFOBVywl7EmfV+Oj7k1HjFPIXM27PautB2CDj
	 TSzUp5QYz3QxhSU5wxiRYLmwXi8imOxwo7cAkXfmaYhGf5jycaZt0HDVehVsCSLRDfHgO
	 43bJwuIWUM76+L5AiyWTHJS3m8WRhgET4MEGzPKrSy9Ee8OM93l4kls/ewEw3y9JEHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fgtT2+a9TrTITBRXB1pk27WkIgQ+nxQrQ3NB1J1hYuM=;
	b=jD/REYmpp3WYjPIgIILnP81/yi6+hRKbRK+UQTbiijVnQRsUci2nvI8zucTXkPo2pHCs
	 gShuziEQ60SsRJpvdK+VR6KDfqDrdlbRPNeQg1OtZxsA6PtU1wvOS6BkLMDkuZQzxDfIF
	 sKY68CALMvzTeRHwJvdc5D5/blDuMZHHVirbo/XgizbZwdyVZo2Pkr6h4YoLhRDxPTZdM
	 zLBcpOJuzXegIZYYV9dHX9tHzmWw22XB1XCsYD0rSJIeJm9zHod3YOtR8OMC4hK8F9VIx
	 WAQ6zDVm9daKrpCAqxDOFQ7elyRwezKIp3YMgxUpkudR2UOQa6OC4jTzxPCRFx9Yv/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KfoU/C5V";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77D606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD77D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KfoU/C5V
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so21273125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616455; x=1794221255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgtT2+a9TrTITBRXB1pk27WkIgQ+nxQrQ3NB1J1hYuM=;
        b=KfoU/C5VTwLgglWwOGIhOu2WjOGvxbM3LY2fCfJz6lShfFpPvqzy4ezwM/iMiYgL+q
         Tul9qsTFt++Vxvo5bj+KuUneF0k5khy7EkUtw3aga+Z2wW4RYU6YE8GJuraORD8x08S/
         aQtEf14PxG1LdsFtNKFgAq/Lpj2k0gGfugTqfojHwT01jomsA0iz3y0RfDCao2L/qmfm
         65mIOVntxKNAxTZzjP9b1wIthVOejEPTuUOOjULlkmuMz9/xT40F6sutVETL1s64XQqg
         0PPGjTllaw1G2DtC88d9PLKw6sF1RjF4k0+wdB5iPssFkdXmYpzHNeklTP2rebzN2zi1
         rHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616455; x=1794221255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgtT2+a9TrTITBRXB1pk27WkIgQ+nxQrQ3NB1J1hYuM=;
        b=iqtGBYma1gKWVdSK1kfK4GTyi2Az3QFYN4Sl/YJTypon+alfbd/JqAo7L1i6NUm9bB
         grFWP/+KMuEb5s1mX9G9rUiqzbx3pNyoTteh+EUj8rxET86ABSlwhawi+PvEMMEFw7Q/
         /KQhRdxUAul0+ieTeUbypL7Mz5CHJdO+Dkf/L7CWcUsmnCZrWb+xVv/cYR77UiOair/O
         M6tuqVDsx9cFtW2y0a18YC+Amg3fl0PgbHvFPxhYutAFT9P8ZiUMRBWt0nzLZXkJDy53
         +WYyR8FBaFfO7sBOYzIWa6Whdlpihn6xbzRlX5upRBhspfTJk0PrFNRpWCZTQ7l0HR1f
         3r3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzODbjo+jLkxFB7FK8HDIeP7oXV7vJ30bPf9ERPHXZyVutExaPxF+qsJm2+H9vLcZZe14xlsvEcQTrWt+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzUIAVlbcNcVyBzPNxESoFgAWSoX5y8TTfTqyuv/oaV6QGEN7
	CZUN5W7aRS3ozcGf+wU+ZzZ2LB0YYfEOiIrkMUspS9NysNQOXyUlVMhrmgkd1AEL
X-Gm-Gg: AYBFou1Oz/StRmDgNGO/LzwC0WRN8jALYAAGkqMvpaRr9zw1eROv5620Xr9fDKzmlQZ
	XueWZLPgkorYc9nUQV63WuqPrNWHI396K0nDGXFCb9JmQYwrvTcGBj3czqcXyOoVC0V8+lb4H8z
	X0hdt8ITOsnvURFyLLAQoskgGO4rFs801Wbmp9IJ09+1t6eet2Pz+E258XIWzJQri2Z6LXP+Nm+
	pzoHPJq/cXlRwZ88gsYesNNBHccOjA40iJJINU+FZX0HSGVbqS7PMU2StVEcjC51iEvOlsSHKvH
	/leEAxOzdjpXyCmYoJGRrDHuXDbfkDUp3pakhyBSLbrXgwtldMGcHArhKy2gPRdN5ZhIXY2e79X
	H3urwyriV5T54SZB8Rpi4lGWQL20CIT26aBpntBSJx+mepqoim/ADjQ/Y6T2Kf9QeeZv+g/Nb97
	pdZh1fRYKO7PqeADUcY8OZmTNg/bLSZ2WEA42EvFuSuZWANHi60BNI2V//VM+DKoSsLT9ovCM14
	9cVu/G8BqwNcsQAx5LeDuA9t3krJAu+ti2ASQl7rRr9QoqSeigt15WeErkDKv1EHC00unbn9qRQ
	hi+WBdXv3+sAFm4wYeGfjkySX3Zos8D4HefCA4Pz7eF0xtw34+ZzDpbr/cHZMzdJ
X-Received: by 2002:a05:600c:6992:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4ac18992c01mr220277725e9.30.1793616454928;
        Mon, 02 Nov 2026 02:47:34 -0800 (PST)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm248939695e9.11.2026.11.02.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:47:34 -0800 (PST)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: brauner@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	viro@zeniv.linux.org.uk,
	jack@suse.cz,
	tasos.papagiannnis@gmail.com
Subject: [PATCH vfs-7.5.bpf v2 1/3] bpf: Add bpf_path_getattr()
Date: Mon,  2 Nov 2026 12:46:53 +0200
Message-ID: <20261102104655.70901-2-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
References: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
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

Direct inode reads can differ from stat() and related system calls,
especially on overlayfs.

Add a sleepable LSM kfunc to query a trusted path and return struct kstat.
Use vfs_getattr_nosec() to avoid calling security_inode_getattr() again.
Limit the copy to the smaller of the buffer and the kernel structure.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 fs/bpf_fs_kfuncs.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
index 35ccd98a4de6..97afc9659f1a 100644
--- a/fs/bpf_fs_kfuncs.c
+++ b/fs/bpf_fs_kfuncs.c
@@ -96,6 +96,40 @@ __bpf_kfunc int bpf_path_d_path(const struct path *path, char *buf, size_t buf__
 	return len;
 }
 
+/**
+ * bpf_path_getattr - get the attributes of the supplied path
+ * @path: trusted path to get the attributes of
+ * @request_mask: STATX_* flags of the attributes that the caller wants
+ * @query_flags: AT_STATX_SYNC_AS_STAT, AT_STATX_FORCE_SYNC or AT_STATX_DONT_SYNC
+ * @stat__uninit: buffer to return the attributes in
+ * @stat__sz: size of the supplied buffer
+ *
+ * Ask the filesystem for the attributes of *path*. This is vfs_getattr()
+ * without the call into security_inode_getattr().
+ *
+ * This BPF kfunc may only be called from sleepable BPF LSM programs.
+ *
+ * Copies the smaller of @stat__sz and sizeof(struct kstat). Any remaining
+ * buffer bytes are left untouched. On error, the buffer is unchanged.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+__bpf_kfunc int bpf_path_getattr(const struct path *path, u32 request_mask,
+				 u32 query_flags, struct kstat *stat__uninit,
+				 size_t stat__sz)
+{
+	struct kstat stat;
+	int ret;
+
+	ret = vfs_getattr_nosec(path, &stat, request_mask, query_flags);
+	if (ret)
+		return ret;
+
+	/* struct kstat in the program's vmlinux.h may have a different size. */
+	memcpy(stat__uninit, &stat, min(stat__sz, sizeof(stat)));
+	return 0;
+}
+
 static bool match_security_bpf_prefix(const char *name__str)
 {
 	return !strncmp(name__str, XATTR_NAME_BPF_LSM, XATTR_NAME_BPF_LSM_LEN);
@@ -504,6 +538,7 @@ BTF_KFUNCS_START(bpf_fs_kfunc_set_ids)
 BTF_ID_FLAGS(func, bpf_get_task_exe_file, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_put_file, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_path_d_path)
+BTF_ID_FLAGS(func, bpf_path_getattr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_get_dentry_xattr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_set_dentry_xattr, KF_SLEEPABLE)
@@ -515,8 +550,9 @@ BTF_ID_FLAGS(func, bpf_sock_read_xattr, KF_RCU)
 #endif
 BTF_KFUNCS_END(bpf_fs_kfunc_set_ids)
 
-/* Side-effecting kfuncs that stay exclusive to LSM programs. */
+/* Kfuncs that stay exclusive to LSM programs. */
 BTF_SET_START(bpf_fs_kfunc_lsm_only_ids)
+BTF_ID(func, bpf_path_getattr)
 BTF_ID(func, bpf_set_dentry_xattr)
 BTF_ID(func, bpf_remove_dentry_xattr)
 BTF_SET_END(bpf_fs_kfunc_lsm_only_ids)
-- 
2.56.0

