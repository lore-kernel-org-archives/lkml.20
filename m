Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268044;
	b=pq/GKu3eeNaF3knsHJ9qnrVyr93CWiXDmUBXuk0onEKrFyy+teSr3QqagBXzWCxz268l
	 tfSngPZ8N2sEdpjZkFnNLJ9FGz641Z+Yjy1i+dKsYkJYCWpc6MoiNRQoEPjiC0mpB15Yq
	 pB1R0587hPxIfo3VOLlzeRUsDPbeyaxiLuflTQo2tlyvzuJHMHoeZV8Tbj/bwyhMvB78z
	 jLG6QuR9fABe5VDg+mddhAKwWwtxLGSxsS/BX6oPnuJxxfAR14PgvqdxdaRHoOGFTlmdK
	 jHeoym8CkMSHSVkV+Sn3SHSuHF78AS4ADaAbiRlKEBaIQptnKoViM0FVC+ACwk6W1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NvDQgFPrYIv0RGOIRNSHY0lOqUOFb7lap39i5lWlHGI=;
	b=ZlY9mfopBflihyX+k87PNiqYx+SdEcgJwjtKspY0/uDWVkJqLIyMIjym9W9oGh9bGbVb
	 kMnwkL28ekov3MNUsD3aaze6XtZWmC8qCFAMmbqFN3nVZHj6pVke7xavRcPFuBvTwufTs
	 dQ8Vp9KSLzOwuNCTpWNv8OIhDlVEDd31lM9LeQVi27+eaBNghYpNWUYrmGwOAMSUScHZ5
	 +pF1QUaYE6KBDT00F1iOve+wSxMj5bbbcs8pNiQA5PAU6QrgwpqezctJn6mF+uTqfeO0Q
	 nBwx193hpCkgCh3BQwZR2Wk/gu8lnCH82emcYf0xPqSyenqYDUnqyxuXXP9tgEKfqng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNFACqP8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCC60A381B
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDCC60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNFACqP8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1133552f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268043; x=1793872843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvDQgFPrYIv0RGOIRNSHY0lOqUOFb7lap39i5lWlHGI=;
        b=nNFACqP8iH14vZfcni9/+w+f+fwBLOpoZaFcjOLzlKZ0Lc6v6A6ssBwaRpFxnSnbvQ
         ZoRa+MAPqZ3FZcjxzkUja8ZDRtyVYD6tZfr9AEvR6zZ5m7Q+bogw8lq8ZGmBgj0tMJ9x
         HxT9Dpah7EuFtNNvHKjLwEpLoBfLLGJtYMlplYy8lb/zPpHCly4atpF+jH6kdzenzDQ9
         1cF/fW9U92z/5V7r9zFTj5FDnzWS2CWzjd0gICjAnU/wIIp0jERODOj91pWvNcLOO05d
         qJuKYlTLkxtu5pY5uRRljRDcnDx4Zb9SlS5SaDWMvc5rI1XeK0QIUcR6wLbhfNvz99n3
         glPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268043; x=1793872843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvDQgFPrYIv0RGOIRNSHY0lOqUOFb7lap39i5lWlHGI=;
        b=mmUXiXq2OTsx5ukolD+3lDesAKqwxpWxHYLaQKPIU+dUDD3f/yV+7RAYJKi4pdAMVm
         /iS6EBc2trJo+PHsQCbFqMK+gfdgLrud1CwJI/jvIVpxGtBpD+rHbUYTz8nBp41x84jn
         6UFo4WDibEve/H5A/4Nc0NjZuzYz5jmua7LvhyokiQstf01yeQYEG0sqmZftwqWNFBJT
         5AyqPgkcb+HX7SZrNf18FXkWM+bCAzoCieh4BV629NvrgGsPsRRnrCcBUBI0dehHKyg/
         ROyeu/zwWTIe+fZUaKj4xiyg/LSBzvxkZKzEueWbTLh6rWFKgE0uQEXtEFMuGR7ADCbV
         MIsQ==
X-Gm-Message-State: AFq9FYKlcLR+mSeec1Tz9RVm8r9q19uPjInhbTazKa6edDong9dVVwmi
	KEpA3WolVD5CnoiVPjFzOjQc5fQusU0+5WqYLk6QehKgHT7RWztvTkM0
X-Gm-Gg: AYBFou0DdBHrLDIX4bbJGaDQ+K1Jy0vIqnA+MtjR95/a9zv8moB4hU0BpJ1160BPbnV
	kHZriWgmyABxHSPihnupllk8w2LaoK8dtG7357WMA7qWX2RjWrwIOniBMkcsqyzx4E0p4QSaG4u
	DyCe3ui6ElFoKOq+NzSo6jYVNEN2xjCpJOLCfOfqocgMOVsP2CJIORAaikrMqufI/GO6rW4TFNW
	DCqulm/CMqZxBAmxsRwAmbKfEYa8bS9AVxehNwCw9VLDlg701P34Xh8J4WVvbAFtFZXtFKJ3NVE
	c0qDWmxplR7h+6N/7gzH52z7fcNHE8mtOoKPyeGLY98CjAlt1Jw9Bv/Hlgr6V8rLGpzld+QTRzj
	4oap58dAi4fie2LnQxJfoIQ8tAzH8P9Pu8I5dlXRUJLi7BRLNsyS2ZWWBPj0AVQQC9zVi6PLli/
	0eY2FU3xVx6CyWRXko+/B18lewYdQBiWIyo3v3XsKgtHt/f4klJMmDD7pqLAuF5vbWhREIUpXQO
	nvYuQgAmSzcOxAinYa931tKirqHQS7JH4bp0/WZroaJ1xOxQ/zcLdNs2VYJwTGUPLSZ5GUD5dhT
	+NoQdQH78WYQKs9aW/qsvnP1I6ynDf8ihc5vguwpB8nDY72ARWwx73AA3oO9Hs5O
X-Received: by 2002:a5d:4e46:0:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-48e5d58f60cmr9225873f8f.14.1793268042831;
        Thu, 29 Oct 2026 03:00:42 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm34025569f8f.9.2026.10.29.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:00:40 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next 2/3] docs/bpf: Document bpf_path_getattr()
Date: Thu, 29 Oct 2026 11:59:51 +0200
Message-ID: <20261029095952.44833-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
References: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
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

Describe the interface, result fields, supported flags, and calling
requirements.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 Documentation/bpf/fs_kfuncs.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/bpf/fs_kfuncs.rst b/Documentation/bpf/fs_kfuncs.rst
index 8762c3233a3d..9e0e391bc007 100644
--- a/Documentation/bpf/fs_kfuncs.rst
+++ b/Documentation/bpf/fs_kfuncs.rst
@@ -13,9 +13,22 @@ BPF kfuncs can be used to get these data.
 
  * ``bpf_get_fsverity_digest()``
 
+ * ``bpf_path_getattr()``
+
 To avoid recursions, these kfuncs follow the following rules:
 
 1. These kfuncs are only permitted from BPF LSM function.
 2. These kfuncs should not call into other LSM hooks, i.e. security_*(). For
    example, ``bpf_get_file_xattr()`` does not use ``vfs_getxattr()``, because
    the latter calls LSM hook ``security_inode_getxattr``.
+
+File attributes
+===============
+
+``bpf_path_getattr()`` queries filesystem attributes with statx(2) semantics,
+including overlayfs inode and device identity. Use a trusted hook argument,
+such as the path in ``lsm.s/inode_getattr`` or ``&file->f_path`` in
+``lsm.s/file_open``.
+
+.. kernel-doc:: fs/bpf_fs_kfuncs.c
+   :identifiers: bpf_file_stat bpf_path_getattr
-- 
2.56.0

