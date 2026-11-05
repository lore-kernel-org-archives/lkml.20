Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891875;
	b=qtPJRnTQjppJujNYfeR6w0PO++7f+/M9qDUqDOoX7065gdmCFnLSdDEVI0FWt5uhXXeX
	 L96ClZ7ghfMlZdDBOt/iKw3FPP/njbmuuI5NN1HlJco92ssgWMwCMgalO+MHeC9E/ijAs
	 diKaxca3W4S9VgJ9eeCezsPCjL0mzO8uzSRNXXi94f56jGkW1QyVH/7mjt3cDPx14/xv1
	 Az6STjht+YnBp/qURbZTG2PqGWSc3R/uEfkuBQ/hV27keFszWSu53Sw9SJ4PrrJvTBSrf
	 emZlUGEBqX+0enwP+bOMtszxA1gk+RUnwuR75EGEtLcpqZaXEbmHmQvTuge4kAw3EcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SMC+qrNJfteCE2o/qV0U9H+g8BGqFXxMiCMNBQkq4Fw=;
	b=TRciOsafpczjFxKGkbArVDEK8TbjJBSollM7xyUjCYgbes6iZyXO6jupKI44gJg7kB9B
	 TmtCApSImQAR4b98va/Pw2e8HJpNb9JPyrmHz6YwMZYvIL4LL/iMUZY2GiY6aPwmuetGp
	 OZy1oHxqAb7A4YTj/WxOFpPwwdACNPwbk1P+VSpOBdk3yTI379tC3LEBHJaq8INxUUBpa
	 r5M5avxUFD8BKbFlBZGcqCxqYR+JtHqJM6ixBa8MISyDBkUIKbAnN9XU+qDP37FCs8Cf3
	 kQgN8yQITW0WhXhwY+Mw0dr4RkiBxee5tH5tMB9fEQnocOfrwCl+NcgvrTvqW8YPLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=h77oMB2A;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5551606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5551606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=h77oMB2A
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c322cbc998so518597137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891874; x=1794496674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMC+qrNJfteCE2o/qV0U9H+g8BGqFXxMiCMNBQkq4Fw=;
        b=h77oMB2A5XRyL7jxp+5PvELDe06BT6sutaaCGWAvrkxChsFzlwb0TFG6mRZZdPITPK
         +cOpsQOTGJdQODxOeVaj6RInp9Xj/Q+mXTUpkuO0Vaxkh/jookOT99XwP5JeZ6Pk++mv
         tZWJWCbjzRHInRrQcPsyLgRihNHkKPXg0dRo+edrDpuQe/nkWyo0QWa5ZDaZ+LNaXOzO
         68EYlsnR9G54V4Y696ktTvweJelWQ4pLwS/bC9IYTt+40Sp/A2x60Qyq+hyMi2TCn/Jf
         eFt1pWEKl6pOmfSluFMYzmeKxe04zArMJxZNnHTHRVAcJAE0nrAozI70s6KNNi/Thkr1
         M4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891874; x=1794496674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMC+qrNJfteCE2o/qV0U9H+g8BGqFXxMiCMNBQkq4Fw=;
        b=GEHLiXXNlL23WqwIzcOK++9JBe5rAWuJudfOpu1mkMcvHrO0p9+0kIbff63O6VS3Ti
         5ojC8J3VEt1dd0D1a/TVJQCWOYUfCtfU0XvmW2kP6ohzRIHME1nJyA81n0GlXSqNaEar
         sXV0y5kKfXq77P2Oujpom7BfwJIRZkwM8ODUKhrDkUw4ra3iTfpPYJ01XWwQsiYn8GhN
         zlFkblry5C4ijG2pxJA8coQ/KxtUBHpfSEy4eMCXG8uk6ThvzQosljk8ievLunZQhWkl
         5fVXKw9X7GHtFy6qSrOjM1DEP3/ZcclZysAXI6qhKPw6F9LrVyUlLFrR1fCQ7Jk0b8jp
         /2dA==
X-Forwarded-Encrypted: i=1; AKwUvBy/+YcUGlcN17DT0VrLjbTXKDst8Ztk/DDQKiRHzFrPtugQ6TVYjRcOWW/YD6wl86nV0EjgXl+THzNXmCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IxCNiDXaesrV5LNqY/d285vK9kWKcgK6GdqfFJwlpz5AuIuK+
	T8tbMe4nEZ9SPVbeqjls7QgSgKgMd77NdNq3OhdJD+PTjOcqrbVQo2NinrGsQHdQsXC7t+xO/H6
	rIjZWSSk=
X-Gm-Gg: AYBFou197zkLSUzqpmM6APZgH/dODvD01RqgUXrmkeGTYI4Ery+doT1xGsY7QwlVbJ/
	HgJhlIbBDOR7rM+yp9GfVrhHu5EfTmI6P/v+SkqHgJsvOjqJ/GB2MYlX+/7VRTl/twtUqeIv7tR
	eqxqA4O1l+YBO1XdboEISPo5kWejCcclsSRtGfFtYJxQXiWQl90LksGNCF9RoH9uO197ARG1oL9
	xXBu3wXkBPcxaLAnggejTh8mHF7bCMH9QBb5qusGgkY4ezadSxUCTJDmZc3DB5+6RKWFzP2xGBg
	q9CV78UIXOSnYdEeuErOwN1pWF4JoZBv69m8DTcEZ+bWQDRGJMt7Y8ghZXpvR2/+cVk3Iyj7L1B
	/qGXhgiArQreX3zxmaIlUE1vXK9gd+6vrSxfq+9M0OotcixUQCzy+7EszxU0Bk0j3N43acMINEk
	QvX5COX4NqiH9pvuTprDbS/DmSpeMww+7QIXJYf37ZALKUeqi45WrMvOcNaYjmIK/xjpWGTg/z0
	42wu78t6OqjQEO5wSEkunpX4iA4JndkcKnuS8X4n8RzoH8PNw0AskL7J0GB7ETg3s0onE2KSIQq
	433qNHwzfE2bny6JR1MKrJRQnGaeFMhbPmPJxr7rpsvd10+wrxOX+aCxCzI0ZwZgSw==
X-Received: by 2002:a05:6102:3f8b:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7d0726716bemr8957996137.14.1793891873865;
        Thu, 05 Nov 2026 07:17:53 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fe8f991sm4364149137.9.2026.11.05.07.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:17:53 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:40 +0000
Subject: [PATCH RFC v3 48/90] fs: refuse a task of a cell a new mount
 namespace
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
Message-Id: <20261105-b4-cells-v3-48-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=1326;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=nOXPHVO0v3hT1W2sHrZgWd3DNxkisQUAUu39TRuJmkY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP9wmFv79GmH7EDKeFr9zp93V2hE/JATKfuBmIF+AlYfCq6/zq/mCDJAA5ZbBuYaoibPpl4dLA/
 r4dWY2nDD2wc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

OPEN_TREE_NAMESPACE and FSMOUNT_NAMESPACE create a mount namespace without
going through unshare(). A task of a cell could not enter such a
namespace, but it should not be able to create namespaces in the first
place. Refuse both flags for a task of a cell.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/namespace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/namespace.c b/fs/namespace.c
index 7298b589e10e..30167f8863bf 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3353,6 +3353,9 @@ static struct file *vfs_open_tree(int dfd, const char __user *filename, unsigned
 	 * just care about being privileged over our current user namespace.
 	 * The new mount namespace will be owned by it.
 	 */
+	if ((flags & OPEN_TREE_NAMESPACE) && current_cell())
+		return ERR_PTR(-EPERM);
+
 	if ((flags & OPEN_TREE_NAMESPACE) &&
 	    !ns_capable(current_user_ns(), CAP_SYS_ADMIN))
 		return ERR_PTR(-EPERM);
@@ -4622,6 +4625,9 @@ SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
 	if ((flags & ~(FSMOUNT_CLOEXEC | FSMOUNT_NAMESPACE)) != 0)
 		return -EINVAL;
 
+	if ((flags & FSMOUNT_NAMESPACE) && current_cell())
+		return -EPERM;
+
 	if ((flags & FSMOUNT_NAMESPACE) &&
 	    !ns_capable(current_user_ns(), CAP_SYS_ADMIN))
 		return -EPERM;

-- 
2.55.0

