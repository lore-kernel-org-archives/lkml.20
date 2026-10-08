Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F739D6FF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498581; cv=none; b=cuNmzRsxoAEJcyznIMAJ5jJ+eT3k3DjjIy0uYnEWSEblUXnCCMYJd3gPGvL+TzksodRgh4ScLNb5I1BB3GLV+8sbnD3FAOyvyJsgUsD/bBOKPm8wRgQP3mEY8UulJa4GlM0SIUAJ9mfl7BNKZaz3VhQMkpRNnRNLReNGrq0ZOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498581; c=relaxed/simple;
	bh=MMkFjdCVMG5VlmQMbxTqaxCN0UUVNziiQoEjmEPy7OU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWVcGx1P8vwwPHUIhLzSeQeHCeil2p2mKWdzWwgfuCPMJRfIwzIk2FwrYdtaDAUCP8TmSWJcwtegbmbA15i3Rl1decpDjPKDkhf/ov4t8jzGGUQ2kUgaX22O+yXLgxQhXyGO+P7/w/kq0oTXWYWezU6r9nLuKaC4pBKDP5JQmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=r3ELd5KY; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="r3ELd5KY"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-821b5c73292so2995500a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1791498579; x=1792103379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXHi3/KeYOzGlvHrMQmcR6EwJ6rahH5N/eWTDsqU4mE=;
        b=r3ELd5KYh+ph7WvPnW3eDjqD+R83vkIzNIx9LMbwxhDI1xkpMXrL9OMr5aULjlEYfa
         U+ML5WXLyWEzaVjQD3S9P3hZdfd72qBvWffJIZvdWhsQmBchRKU6EWOXhiPNQmhYadCS
         UlBs0eY+ewls+RTLmtQbH5wCQIyP0v4r5vkO6U440d4TVR/56XBUF7cOhZfP1ebU2lG+
         +uhom1xPYw2EecL9SyRRfnb6CtuJ1YLypjFHaSeNB/pMX7CFuJzsfiW4uE3bQ3soLA7x
         n3xjApCKVwFPBJwRjYrMRgvvpb09iX2CWV3iFVCOfCWd5TCjD82U8CvSrQ6D0JMaaxty
         mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498579; x=1792103379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXHi3/KeYOzGlvHrMQmcR6EwJ6rahH5N/eWTDsqU4mE=;
        b=EP9g2Jd0P8TWznG44GVZNUixiYuJXKNqlFuFXkFyloK6Nk4B4X3BclAZtJuxx5E+ak
         I0HW9NRjz2jyWZrN8njojUeyZw6hW8PywYZVFqfWo2FVqX/J+Q7LdbNRRhHRlKl2imAf
         6js7d1OqBpzIAR7d19BgK2R42Py+6zKBoQCBchepU+pX4fiQH3ivE7hkQeJWQMocMq6o
         BmDPPBjKYxHNW3k6f/g+xq8eolsgOIhk35cMpbqj2hJrVsFJzhPfbeIwrfCxXM0CM9NR
         VDXTAFibg0n8dRWEtz9ZwXn8Ik+ISDMuvblgx6UBkcODDh9i4JvO/flTqMJBkm8H1h/Q
         L82g==
X-Gm-Message-State: AFuF++ltLiY3lHKfpfKx9b5IJWkKwuW44VGSkOb0M3Y8x4E6diZ1v0tt
	YFWMwFipwIxL8hVvahrNju+M8qIX6VCWygAWKFlBzzi83jPyb8MJQvxmy0eiWhPfesQ=
X-Gm-Gg: AYBFou37nfUPLCRT8CYr+WZBJdkTJBcq7eifhE9qg+7pYCN8VCEp5y5WSqQng/Y8zPE
	B7pa3ZW07YPpkwvPKvOnnFvWC54PX+MrM59RNN/J8uPjlbaD11YVvkSghoOuZMTxNthAqLpQdwU
	hkYP8Q7mjlVha4FB7szN5mZ8CCHK7EyRPFDQ151pMpUGWyNDa3N96bKi1YwxB33fhRywFzyI4S/
	uG3JAtRyWtNRm/byr4pNaUm7ojeeyyXeURf+vIBpFobS+QyDWevc1j3CtXgAX9QrdEGTShT+6qf
	KMvH6FIuJx1PAJypdXsc6R+gNiEt+oxYZG6iVaTxhhCNxaQrmWeM0X40DBvZi7uM23vF+CBM6pp
	HwcneaWR/2eEK6xixfDkhVRdubxnNNgLGHE4YMeX7525pepVpB4MvirPwxsW4hiduAQDjacc1Jr
	MFFjSqW/vFeegE7ZVZW27iffJhKEnW0RhyGAu4r1y21IPprUFT7hratn5NPummPiYs1tApr4CXg
	3q5NVqH8Fi8K/duUIVpiL5T1Ar3GEndxGn6
X-Received: by 2002:a05:6830:410f:b0:81b:c6da:c351 with SMTP id 46e09a7af769-8302ae8089dmr414913a34.17.1791498579523;
        Thu, 08 Oct 2026 15:29:39 -0700 (PDT)
Received: from irdv-lubao.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-83038f82468sm278874a34.11.2026.10.08.15.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:29:38 -0700 (PDT)
From: Lucheng Bao <lubao@everpuredata.com>
To: linux-nfs@vger.kernel.org,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	tmenninger@everpuredata.com,
	jcurley@everpuredata.com,
	Lucheng Bao <lubao@everpuredata.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] NFSv4/pNFS: defer LAYOUTRETURN after an unsuccessful OLD_STATEID refresh
Date: Thu,  8 Oct 2026 22:28:43 +0000
Message-Id: <20261008222843.63319-3-lubao@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008222843.63319-1-lubao@everpuredata.com>
References: <20261008222843.63319-1-lubao@everpuredata.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c16467dc03db ("pnfs: Fix handling of NFS4ERR_OLD_STATEID replies
to layoutreturn") made stateid refresh fail while newer layout segments
remain busy. The standalone LAYOUTRETURN handler still treats this as a
completed return, potentially discarding a pending LAYOUTCOMMIT.

Set rpc_status to -EAGAIN before the existing completion handling so the
release callback defers the return for a live inode. Leave successful
refreshes and inode-teardown behavior unchanged.

On 6.8.0, this change applies without commit bbbff6d5edd1 ("NFSv4/pNFS:
Retry the layout return later in case of a timeout or reboot"), but that
commit and its prerequisites are required for the deferred-release
behavior.

Fixes: c16467dc03db ("pnfs: Fix handling of NFS4ERR_OLD_STATEID replies to layoutreturn")
Cc: stable@vger.kernel.org # See commit message for prerequisites
Signed-off-by: Lucheng Bao <lubao@everpuredata.com>
---
 fs/nfs/nfs4proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 1ae047a062b8..9993e4d29d72 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -9867,6 +9867,7 @@ static void nfs4_layoutreturn_done(struct rpc_task *task, void *calldata)
 					&lrp->args.range,
 					lrp->args.inode))
 			goto out_restart;
+		lrp->rpc_status = -EAGAIN;
 		fallthrough;
 	default:
 		task->tk_status = 0;
-- 
2.34.1

