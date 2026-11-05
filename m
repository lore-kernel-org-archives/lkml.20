Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892240;
	b=0WZ17J5JSsKqIUjadyG1bqj30H5HeU/zaJBd8AgqcdplluKKwqC7XR1CJXmUQ0JEfw0B
	 bs0KRXjI8i0ipztuyx24AZaiTfeebmdEM5/ksPQ+zgBi8LTdQO/W5GyW9Pzk3h68TxnkF
	 IQslP67JwtIHGtB/Xb/evbPhoYU+uA6twoFhkOhSEB+hhfi7FuEaUgtKGBRLuJuEUFdGs
	 mpwbfPkZ93w+N79aZ7ooq0FSOqU+r5D2ht1Mt+yhry1WftvU3QVM10BwRXpNKMrhqt9rL
	 FCUgUeAwYEybWSayALOVQ+DnRNpQF8W3vL0NvCTH/R15PzFOqZDPMTIlQkDOsg0DXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNhgRqz9zBhtBnU+8XawzxvpxSy1UN2gEvH030GM0ys=;
	b=MveeyToAzAYgjNG4/62hXCjR9GtbxHjABus6ybNnUYp71kQyn+g4YM/7bUCC7/yNsew8
	 /m9z4LtvmuRThwqAz4cWJPR/3g6P10OwBDn/IFs0Y2MpPbXwo6dz0lEqJMT8uqISN3QTP
	 jNjBH50EuexAfmKAoe0Eeoq8dh3NH4qgwtZ9qRiAjILtrG/7xEfu+T2fcCxf3KajC79Yp
	 eSw8UqiTeKov1V83gjZ8P08D6Yqu2YMT9Skk9MClCxOOJ7uJhB5CKuTQxxZAoPOg5VGnU
	 qJ47AF0QmB32jxiJ4fpSnHxKjeZjc3l2MZhP5d/JqRug84TS9IJ+CINdjxBn/13pUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hxb9tgal;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7D8606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7D8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hxb9tgal
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso571158fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892238; x=1794497038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNhgRqz9zBhtBnU+8XawzxvpxSy1UN2gEvH030GM0ys=;
        b=hxb9tgalD25gfP6CVq4fs63HIuR0c0KbZPiAOgCqkbQZX1IPSyQsnsJgaipfuqWUNn
         WAvk6//Z6gwChVAvFbVTt3ehZ5NMi3X1Y0ZzrHULO5bwkrabU007ZjRUBy20oIJG5CzL
         UWm0ugMD0/UjHEBulrAGjtmepzv9RvJx8ia2EyBfW5al6Q7pepMH8ZE9gqJYoOPysPDi
         mMAA2zT23gmioCfJcXE+d2bWYeQ4MsGHyF/qi+z5uJpFkKvMMuD7ji0RnXPlMQJoVtFF
         Emmm4JaL/n0oCBcL4H4o6Fh6VNmmYyRw20Au1DrGWC/kYgt946ehbsp65Y5qGg0llord
         3yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892238; x=1794497038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNhgRqz9zBhtBnU+8XawzxvpxSy1UN2gEvH030GM0ys=;
        b=vaZuyLkeK/TaWNUnxZsC7jVQBYKS4zS1ns8SCR8Qsgq4mUxh9k9F0gKB2Z4BVdOdH+
         ggBhL+3DE67wzJBGs2IkZYJ43c6HX1kT97UcH6lD/dIiKcpZ9Czq7KP3EhuPp4bskUcC
         a4zEByEZ58rZNY8F13BkRz9zgOqUs3vnW9orP6W/Q0fyRSsKFf6c/LeSA5GSpiUdgmoA
         Fg8bi8ee7xEuSTKCWTgjvBEYgCTfgJ52zcsGZ+e+6Re/b6ocNPOaOn2BL16xh1Pc7TWs
         63eO2NJ2H3zzpPljQL6T+t85sV29J8MsRgdockRpU7zhff5FnfCr+D8uKGuktpxQWmk9
         vb8A==
X-Forwarded-Encrypted: i=1; AKwUvBzbgB6OfWk2IYVymyF9svtQYWn+fRLoP8Xp5NsMmZ6wK1SoNyfmnpAs7pDmhiXUlv7QrMRSKiAEOMo38OY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ezdUaviMaqjDd9XQP/V/6YYqWTOrdmuQ/LGXB9Rf1lusOW4Ri
	l+Z+dRPMBpney+m9ziUDp50PwX73Hk46TODicKLrJacLin8/MBToZi3kYvh4DAkiNOI=
X-Gm-Gg: AYBFou2Ikx2D1LNigsCZYHu2ZWStnXPCmwLqLMeM3srCqBcioJrj9+3ZinRx0eMCuwn
	NbfbyyGfkVETh9V0hUL22XMxX5z0yDPUUZSRIxQRWBugvH1uXdXxEUHWT11ZHEv3zYOwKevvKbk
	4EFL+KWwF8QwhLie8s0SwVg7ZMXLuUVhuavd1Dhv67FqvFHlgbBu2itxfCtA0FTXo6DwV6I/mgK
	0YI1TQnDv71NadhNxpcnAHgjvg1DbPXYUg/stApdV9Z0HR/6lG/bqCLwB4z+8dOqU+Eyj2kPWrn
	zYgvHe01IiRkZTwVnmpnVczc+kyCO74lNgPNFXVLvb7WcrC/IaYQ5HSArYtuvomFNVw+d8ubzEb
	GzqMYcLR8+IXoW7xv5cHMylD2YdObSDGFSgSa/2p59WYnhUvs232orNmkwQCfaJkO3+/wGstN8C
	mrF6kTWuNwjQ15xJNGD3hrG0IMABV7Fje+gf1A7k9OV1D0LE9gWuBV3R/qEbWXEO6Blka93fdRp
	+I2e+IAUvkIHTBUXjT9LZIR6OGCd/rYxmvtM+y9fDeYjny3EZFW23AudqiOSQf0NpFacx5l5nIi
	YHeeauCfuiFWPBqvWzBLh+fBv2qsR0uDml5h7MBOY5xf
X-Received: by 2002:a05:6870:f623:b0:49d:d220:e234 with SMTP id 586e51a60fabf-4a90770fb5fmr12484357fac.35.1793892237891;
        Thu, 05 Nov 2026 07:23:57 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea48fd55sm4929307fac.4.2026.11.05.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:23:55 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:56 +0000
Subject: [PATCH RFC v3 64/90] cells: add the "caps" slot
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
Message-Id: <20261105-b4-cells-v3-64-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=3699;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=yhopv4p9Qv5aSxqkvolwlmRaUHEIceXqiSVnH82EndA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHNk1fZtucJ9cJajDPxHPodvTs2pBeAUzZVRa1DK03U6pa+mHvNo31+66NwasbIOOPV+dk5TgJU
 U0l6Nr1DuiAg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The first task in a new user namespace has every capability, over
everything that the namespace owns. That puts a large amount of code that
was written for root within reach of every user. A container runtime then
spends its time taking most of those capabilities away again.

A cell only has what it is given, so start from the other end. Being uid 0
in a cell comes with no privilege. It is one id out of 65536. It cannot
switch to another id, give a file away, or signal a task that runs under
another id.

Let the builder name the capabilities that the tasks of the cell have. The
"caps" slot takes a __u64 with one bit per capability. An empty slot means
none.

The value is used as the bounding set as well as the initial permitted and
effective sets, so nothing in the cell can ever have more. Every task of a
cell has no_new_privs, so it gains nothing from a file, or from being uid
0 when it runs one. And no task of a cell can create a user namespace to
get a full set in.

Filling the slot requires no privilege. The capabilities apply to the user
namespace of the cell, so they cover its ids, its tasks and whatever else
that namespace owns. That is no more than anybody gets from
unshare(CLONE_NEWUSER).

CAP_SETFCAP is refused, because nothing that a cell writes may confer
privilege.

A task of a cell with a single id is not uid 0 in the cell, so it would
lose its capabilities as soon as it runs a program. The seal refuses
capabilities for such a cell instead of letting them disappear silently.

For reference: systemd 255 boots in a cell without any capability and runs
units that stay root. To run units as other users, give files and cgroups
to those users, and stop the units again, it needs CAP_SETUID, CAP_SETGID,
CAP_CHOWN, CAP_FOWNER, CAP_DAC_OVERRIDE and CAP_KILL.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cell/slots.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index 0a406422ce34..a96d2f262aa1 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -105,6 +105,28 @@ static int cell_set_ids_binary(struct cell *cell, const void __user *uvalue,
 	return cell_set_ids(cell, count);
 }
 
+/*
+ * The capabilities that the tasks of the cell start with, and can never have more
+ * than. They are over the user namespace of the cell, so they are good for what
+ * that owns and for the ids of the cell, which is why naming them takes nothing.
+ */
+static int cell_set_caps(struct cell *cell, const void __user *uvalue, size_t len)
+{
+	u64 caps;
+
+	if (len != sizeof(caps))
+		return -EINVAL;
+	if (copy_from_user(&caps, uvalue, sizeof(caps)))
+		return -EFAULT;
+	if (caps & ~CAP_VALID_MASK)
+		return -EINVAL;
+	/* Nothing a cell writes imparts privilege, so it writes no file capability. */
+	if (caps & BIT_ULL(CAP_SETFCAP))
+		return -EINVAL;
+	cell->caps.val = caps;
+	return 0;
+}
+
 static int cell_set_string(struct cell *cell, const char *key, const char *val)
 {
 	if (!strcmp(key, "hostname"))
@@ -117,6 +139,8 @@ static int cell_set_binary(struct cell *cell, const char *key,
 {
 	if (!strcmp(key, "ids"))
 		return cell_set_ids_binary(cell, uvalue, len);
+	if (!strcmp(key, "caps"))
+		return cell_set_caps(cell, uvalue, len);
 	return -EINVAL;
 }
 
@@ -163,6 +187,9 @@ static int cell_seal(struct cell *cell)
 		if (ret)
 			return ret;
 	}
+	/* Who is not uid 0 loses them as soon as it runs a program. */
+	if (cell->ids_count == 1 && !cap_isclear(cell->caps))
+		return -EINVAL;
 	ret = cell_make_pid_ns(cell);
 	if (ret)
 		return ret;

-- 
2.55.0

