Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890703;
	b=rn/rcZLQvjGROuBUr/w8sDXXn3rCo/OgUkHY0INVJ8rj5keXwWSz4QZtYBlUS+9LBGrS
	 y7UpVYRmH55AGG60aaL6fWbpn5OdPMGJMDdqdkpCmUFl38YX+DIKffYGl79lV5PJ7sYOt
	 JmvjlylLb4LXoWU6WNlh/LjPpmorIpnL/XFHBFX1sfqBWPmWEvVGQOobnzWRvspZcbw2u
	 u/9ujNXlYEA3BoCvKy7euq0xNdk4gqHuNOIujstpwg2pZIa7llgu82bwzWEuDw3ZSi5CM
	 Lp7PhrZW4ppMmpqAN7KTiThBillYOZWqmYOxCO71bV6VxSIjFZwtL4rKvyhkv6DEaYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=H1stpwrLZ6auV0mYKkOepVEMvJtvARQMcHoHV4Y2RjU=;
	b=dVfCC0cwYGl/5W4Lr34UWUTMN0X2RNbNEf3M+Gcur6iYFNYKXqo4xR9PG0rP+4OLCTWJ
	 sIHDv4Ilxh9N6RyI0dYgMcYqVXffHjxlB5/Pv3DdX1+gfzlPIr+JXauETe4Km+qg26pqS
	 mKtzRS/YLZjyq4ZvxIRRwKYpNtE5LHGV0M/sIcqioL1gz54jirHoLV6tFL5FbH/NCpBFP
	 KaABSxktzgpK2y+O9VWZorsYnrP1th8LgfhT0h1YB028lr/qGhVa22rVoL6lxvKWtXdn1
	 FS+gKJKew5pH3woL/Xf8kxi5vg/sRxZqNIR1ufP8HtocP2G/6WnBpPGpW1NSgdcpskw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=A++EXYxm;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB8606EE8E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDB8606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=A++EXYxm
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6dd7070699eso1344898eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890702; x=1794495502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1stpwrLZ6auV0mYKkOepVEMvJtvARQMcHoHV4Y2RjU=;
        b=A++EXYxmekBv2s8nG6S8FSKUj2jWd4PGNDrKKJJF0hvCDnLmNvR9Uu8BnMuQIh84i7
         DAq8iOY1yUj+C/gFg4O6NoG+D8r6gHDzQGgX3Bbyakhi+Of1gUBgOsVXl4vnLZFbAl+o
         2xNZwgqTOnUfDqE4V/3UrT4Op72siPHvCpnqb+q5AToC0rpj2d1Xh7j4dbduE4nDi9RK
         J6yB92p0k/vw+UMzbsDaNyoL5gVxAVECIHfTqf5WQoX8jNRz2CN0knErduIJ0uAdS1ii
         aULqrIfeX2wHs4/H/qH/Qfk9TN/WGBwd5R+NW0yugeP44fvzGQLViP9fwLITtebp7YXY
         tcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890702; x=1794495502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1stpwrLZ6auV0mYKkOepVEMvJtvARQMcHoHV4Y2RjU=;
        b=ijz6jxfz6RC+MBpchEF6a3mkVStPx+rrkCid7szUuKTubxfMEOjfLX2jcHC64a33Dl
         IjQfHjcOYDK57FjEpdjuLlcTTM4ZVIB4qSxWcGwcvK2DI9JuTro6ym45LGOzjUI57WLQ
         esJXmDKHzscontn2iflzRa7VYz4tLADMHnJDh2cHsWdvr92yOUqsXMnzHqUSKsxoKIp/
         wp9hXFY1pf1b9elAqOQ/E+ihdkaUxYKUfJTpvvylOgJoqJ5eSHcPRSqRDxnP9ucpEcla
         ciRqG7MW+R56fDcieo/XHmvHQVMWZ1q8cb6cFX9RptveK+Cko2BBrJAgOU5rEOkU6pXJ
         Bfnw==
X-Forwarded-Encrypted: i=1; AKwUvBwroHJS4en0LOzvgK+aW/Rab4w40ZRMjAvKvf6/mWZKWPKHb380Gafzu1MBJyZK9t979DB7J/eswBBmhWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EnZ4FEkqPjupTLX61Oa/RXJSS66B4JbW8uPrdtvdLblwjh5GU
	UjfzWoyeFh6MJjMhQTW/eUv4q/bc4RoXMwcWlGIWfu/eqgz1+4+QlBHv+kh5QZLGm1E=
X-Gm-Gg: AYBFou18fNIA5Jj7OMOmSK36ZTWLWRH5POQCEs5S5z6er0yxLtD/utkEK3G1skTQJpj
	8HMkvFX+pe1wWFGi8hRRDeAG+VL4Nwzm2bxRhovmscMLh+IvJNA5oo9EwrDGbNAAv9w9U3cz6VW
	tsNRQsTJrHEB8LunnajM5xM+F35REsYfYhHnIy3IohM884gszPZOp3D7i+DLTSJB/CJC/jH9er1
	juelzv1heO/4jh4Dz68+Uqmg1rGzpFjW4an4vbi6H+WTEmW2HX3ODFp5bnCw/jcJKscyHaKz19w
	WzUnAS+p237LGrjUTqYnaRYQ/M2mCe1Bn05ZEhEOovejRaBgRbloU1TLKXzcWusXQXT09q/I1vu
	vZw95v93KxwJ6XDVE7Q/uNo2TyGVMZzzWVNV4AB2+i1h0LmDMgGHSKmwnV9g01wHRibs/Tybfjw
	eTvmKF/FyWpkBJ7IRzsYiFVwXS0MgZmCD+yyGK9nolXSKXwcK6kcc52OcXNOr/lQ2E/IcG6oYuM
	ZiVYJIKEK5W4pY68UWa6yT1wvzLvlEPbwybsGRfW61pnBjEElZQNwOBNyvZWOXQyrEqfvgrDb9O
	+25yaw9qi2EvVBT32qP5IvyI1o+c36hD3MNJQ5nkR0dkgw==
X-Received: by 2002:a05:6820:f029:b0:70d:dc1f:8883 with SMTP id 006d021491bc7-714f23f5e03mr12130997eaf.35.1793890702346;
        Thu, 05 Nov 2026 06:58:22 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea547bfasm5003452fac.7.2026.11.05.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:21 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:05 +0000
Subject: [PATCH RFC v3 14/90] fs: take no id of a cell for a mount option
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
Message-Id: <20261105-b4-cells-v3-14-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=2208;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Vn2rnoSO++eAK8WFIcQeXvGMeknHoBHY25i81qye0GU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFZU7x+FLD8VfyykqJXBl+60IQfKGF2wHRw5Bhaj+uynYzCC42zXiSo/m9/qrS06/DP28WPShdM
 rFkD8YsqNGQM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Most filesystems with a uid= or gid= mount option assign that id to some
or all of their files, without checking whether they may hold it. For an
id of the window this has the same effect as a chown to it: the files
would belong to whichever cell is lent the block next.

Only root in the initial user namespace can name such an id, because no
other user namespace maps it. But the rule is about the value of the id,
not about the caller. Nobody is supposed to name the ids of a cell, not
even its builder.

Refuse ids of the window in fs_param_is_uid() and fs_param_is_gid(). About
two dozen filesystems parse their options with these.

Not covered are filesystems that parse the number themselves, such as udf,
ntfs, zonefs, functionfs, hypfs and spufs, the access= option of 9p, and
the anonymous ids of an nfsd export. The design document lists them.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/fs_parser.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/fs_parser.c b/fs/fs_parser.c
index b4cc4cce518a..0e8c84459c45 100644
--- a/fs/fs_parser.c
+++ b/fs/fs_parser.c
@@ -5,6 +5,7 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <linux/cell_ids.h>
 #include <linux/export.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
@@ -331,6 +332,9 @@ int fs_param_is_uid(struct p_log *log, const struct fs_parameter_spec *p,
 	uid = make_kuid(current_user_ns(), result->uint_32);
 	if (!uid_valid(uid))
 		return inval_plog(log, "Invalid uid '%s'", param->string);
+	/* Nobody names an id that is lent to a cell, see kuid_storable(). */
+	if (cell_id_in_window(__kuid_val(uid)))
+		return inval_plog(log, "Invalid uid '%s'", param->string);
 
 	result->uid = uid;
 	return 0;
@@ -348,6 +352,9 @@ int fs_param_is_gid(struct p_log *log, const struct fs_parameter_spec *p,
 	gid = make_kgid(current_user_ns(), result->uint_32);
 	if (!gid_valid(gid))
 		return inval_plog(log, "Invalid gid '%s'", param->string);
+	/* See fs_param_is_uid(). */
+	if (cell_id_in_window(__kgid_val(gid)))
+		return inval_plog(log, "Invalid gid '%s'", param->string);
 
 	result->gid = gid;
 	return 0;

-- 
2.55.0

