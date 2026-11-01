Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494601;
	b=dhkZIx+7w/bDp4+47PgoOgQCAAYatRh9x9T9S8Ihx9D0exQPd2CjftFsbm6CdnBNshaN
	 HyojdAntnJ9F+Brljm57qsKU5sOdyqwR8qiO8stVQyB6S5ft5H8FiyiFBUbWfQaf/aTIQ
	 s2gTmrrlyCm1mAF3esydaT7qHA880MQrdBZFJ7NnFc6Xmokavgv5IvRaxJmNGFCjJsLk9
	 w0cTTqIEs4PmcwlFtAa4hlOOxJ7nC0Oj/ZNkqUUlTiaWC7uWfjxZasH1DbBxqgagWPFqS
	 rV1L25KrrGoUYubRjURN9aBygHiR56j3ah+hMauUmGIKtzMKTnNgI7oebOkI3eDT2bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WpPmlyynvDUMe1He5kADoWQv2vMHrwCbBfff4xiiiVY=;
	b=I3DV1bnsx3gO7FdjiKSXRCtaGuiOnGzB+EqEEoMi3ugm0io37deD5t8tfDJH5+771Qmj
	 Fi7KhyIxQAVCM0sW1ZQxgJpTU8wWK6wzJr/blfNrMyT8gOCzveHIu6cZ0Fu49BPS4BP4K
	 g8T/aSHM+AJLlCexAk6f5oeQMv9GFsvBGjJd9GMCGZtUuFwbsSGCwgJsB6so6a/GXv318
	 ZVa3Hc9W2Fg+L2cxJbbdoWN6MCDJBx0ESdPKL2+lotNTitJPE6LuiAJ54pvrUwdyCV9Bw
	 mURbZffaKumyP54UIJVtXueZ/BgNKoPsusANQrFR2GmtcUHoQ29KIExDnrodJkZhimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xxu/mCu/";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C601A606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C601A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xxu/mCu/
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1060114a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793494600; x=1794099400; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WpPmlyynvDUMe1He5kADoWQv2vMHrwCbBfff4xiiiVY=;
        b=Xxu/mCu/OESL41DxQmT3WfQHPJJsrR4xVMtYEYQ0t0SplR5AaE0nB+FFeycO0fv99G
         QeV5kqJw04aM2yv9L3RVq5xoMMqAxapcIBkPRdAxn4DqZaRM70kQGAtH87eaPHFBlxXg
         KeTyW3gHRaeVi+c0weAHStWKQVFttPKKXaOF/Gx98HGGhQDaRfwUvSqaJM4Nn/AWqIpC
         FasfEij4IBss6TEkUYjnsce476QMHqGpg95S8rZkdABCJ1GjDvA6NrXs5Ak97uRsWPnr
         6n4ehoRWkGKA0mXUJN5owRgKTLJoeCtKQZmyoeU3WiFELnTJv0E9dvggRpgqP8SHFVTt
         udWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793494600; x=1794099400;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpPmlyynvDUMe1He5kADoWQv2vMHrwCbBfff4xiiiVY=;
        b=A/FvtquKce07n04T0wUIUMl/WHwZOb8o+5ob6y0l+pJLigYW4nxH9Ur+59BNu/Y27p
         BeT81RMYUtytn4es8ixNpixOg9ToSGIVErXDkBTX9r68BwcKHSza0X1VXZeZy12+dsdL
         sZMAKXn/RmjXnGsLDycyLAxVypc6cdBniNsoHrPUT75VMnJHXx93b8ZbJ6Asw0WbZ/XY
         /pXwdwjYutoCm10T6EGoBedlon/7a6LFgUUH4a8ePwchxw3h/kBfrdOhX74S1hwQF8kd
         7PERBClKsN9x19v7HP6dXILMLpYpnc/g9FNX51T3YCJYLA36Z50DF+Tua+GQF5Ib1kPF
         AFaw==
X-Gm-Message-State: APuU4Z+2F5SF+qtCHcMh4JMgcR+/6W59XnVeKwGN7qZQGPkn9BLmIoHU
	Pb9SEExAFx9ilYzI1s3S9WW7VKCCD9j/ADFmWxS6qScF/TcXEdvTWZKV
X-Gm-Gg: AYBFou0HYdBGyGTHiQLy7XfcZnn8Q4qajtc4I5ZpbdSAK+/96CfFAbBin03lG0Y3W73
	f+RtEbGNXC5CSDsZkUwLlujDm2iLH95knXE6a/dQ0mKgJrQ51b87CrpV8JanpoRf9NfUGdlosxA
	PSRhxHQ0O/P1abY8XaXFp5ZjwU27qYCn8dT/3X/pyA6rFjbr3PoldLVE7vdC/09AqOYHZzOBdW6
	weGm1o5bs3qPejX/5gU3h+r/c779ECQzG4Dz5+HeTsL8cDOkVsc6fcdqp4I+2vaRORHmvXfcqsl
	Ac3e54DY7QVhah6ZixgL262welcPSjehGON0DZ+NMFG5MYe6ypek3fyfS8UXt3/IY021mLFeIjC
	LUMOynrm0kRBaCysXiDbaYcW32jvM/wjGILiqIzruFkcl5m7mYmcSvqNPrZUqmItK+nI2JLN5k4
	B4zYyl1MAAht1GK0umjh+gYmgwmdoT7KhjRIzWf/+e5ZlAcNJcmSFFkA2KgNxCBarPOd6nKBRwa
	wEUc5IsAFctV1zcR9mUTtE+ZjWQtnZyyyz02HoTTAOm3oa/futa5UWISN7E5v4lBTz7Trqg7P0q
	F1FBLs0Gq3TTeuFMzEZ8AQSLbung/IWI4Q/j8h1HrbtHzHJ45KTX2/Zu/StIfeatX52ORC0Bv5j
	uOiCIHbtMphiok0/B+1t/ft/BwT1laB/abUPNEqqsLvrX07ZzEwOAb1g=
X-Received: by 2002:a17:90b:1644:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ae897c94ddmr5486226a91.47.1793494600050;
        Sat, 31 Oct 2026 17:56:40 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880a46f1sm3921333a91.3.2026.10.31.17.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 17:56:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 00:56:38 +0000
Message-Id: <DMJGRWDYEWL1.3FPGI4KTRWAPW@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Anastasios Papagiannis" <tasos.papagiannnis@gmail.com>,
 <bpf@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <viro@zeniv.linux.org.uk>, <brauner@kernel.org>,
 <jack@suse.cz>
Subject: Re: [PATCH bpf-next 0/3] bpf: Add bpf_path_getattr()
In-Reply-To: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
References: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
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

On Thu, Oct 29, 2026 at 02:59 AM Anastasios Papagiannis <tasos.papagiannnis@gmail.com> wrote:
> The kfunc returns a 64-byte bpf_file_stat. We avoid using struct kstat
> directly as this is an internal structure and this can lead to changing
> the user API. Inode and device identity follow the filesystem's getattr

kfuncs are not uapi. See "kfunc lifecycle expectations" in
Documentation/bpf/kfuncs.rst.
The prog reads struct kstat with CO-RE like any other kernel struct.
No need for bpf_file_stat.

> operation, and the device number uses stat(2) encoding. Mount IDs,
> mount-root attributes and ownership translation follow statx(), including
> mount idmapping and translation into the current task's user namespace.

bpf_path_d_path(), bpf_real_data_inode(), bpf_get_task_exe_file() are
thin wrappers of vfs functions.
Lets do the same with vfs_getattr_nosec().
like:

diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
--- a/fs/bpf_fs_kfuncs.c
+++ b/fs/bpf_fs_kfuncs.c
@@ -96,6 +96,37 @@ __bpf_kfunc int bpf_path_d_path(const struct path *path, char *buf, size_t buf__
 	return len;
 }
 
+/**
+ * bpf_path_getattr - get the attributes of the supplied path
+ * @path: path to get the attributes of
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
+ * Return: 0 on success, a negative value on error.
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
+	/* struct kstat in the prog's vmlinux.h can be smaller or larger */
+	memcpy(stat__uninit, &stat, min(stat__sz, sizeof(stat)));
+	return 0;
+}
+
 static bool match_security_bpf_prefix(const char *name__str)
 {
 	return !strncmp(name__str, XATTR_NAME_BPF_LSM, XATTR_NAME_BPF_LSM_LEN);
@@ -504,6 +535,7 @@ BTF_KFUNCS_START(bpf_fs_kfunc_set_ids)
 BTF_ID_FLAGS(func, bpf_get_task_exe_file, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_put_file, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_path_d_path)
+BTF_ID_FLAGS(func, bpf_path_getattr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_get_dentry_xattr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_set_dentry_xattr, KF_SLEEPABLE)
@@ -515,8 +547,9 @@ BTF_ID_FLAGS(func, bpf_sock_read_xattr, KF_RCU)
 #endif
 BTF_KFUNCS_END(bpf_fs_kfunc_set_ids)
 
-/* Side-effecting kfuncs that stay exclusive to LSM programs. */
+/* Kfuncs that stay exclusive to LSM programs. */
 BTF_SET_START(bpf_fs_kfunc_lsm_only_ids)
+BTF_ID(func, bpf_path_getattr)
 BTF_ID(func, bpf_set_dentry_xattr)
 BTF_ID(func, bpf_remove_dentry_xattr)
 BTF_SET_END(bpf_fs_kfunc_lsm_only_ids)

pw-bot: cr
