Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003155;
	b=2DYKQ+3FiQu27XzmyYY0saH8vHPzEpHxUunR5sVm7wV89GENUfXYdEW8FTCFD1ZzdG7T
	 bK9af01mrJ3zKqySphFg5diRbzlEnMsPmL78uNNjgolGArj9mkKqDhtwDuelI4JELd7Iz
	 5sD966lMfwY1UB69z0Yk+oDdGupbkpAUyq1d2ztpBFxY41ijtuyjVT5d2b+EozCjVbVej
	 W2twNk0+khp50/grggyxSMO6m7Xgm1SWFFxR8ofZnSZSZCjZ0pTukD9LYC9l5vVy0SQAT
	 hcgBnGvwtyL4GDgZuuNJXTWu50Wlw3Lwih/5QBTYbwG/e+wZA7b7YzbNUGo4vpy3JNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3xQwU3ZXVkpG6YMTBCPOnzgaVBcLxcmMgkLkbyRVzIw=;
	b=wdns54g+Bnwf+n7Ne16dtH1aYGOgJHov3S9avWeZQVK8lERY5AAlags23w7oXI+cwLwV
	 zkb2HuLJ5EDr8Q4txVKRf6mwsiD0eSol26t3UyDlYyVyp/3PDiYr27ngte46/ZjKTSON7
	 UZJn3fwUtzFOJrgujy2z58AZg1t6Xad3EdnfXBkIbwnuVvqtpLnXHHZkGRbanMJi7yBo/
	 HOzDIdyzYGP7Mjmrq1iZRzQm9SqUh4foyAr+lu7sRORhrBhn5/r4fN0cXUUrD/DETT8xq
	 c/BQdUEFAG7BUka3TqiHQzjc2+82bYpLEPqkV4nFghX/T5rx2K4caoBZ+JiYOSniQhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CeDkfV1X;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A717C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CeDkfV1X
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso23714655e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003153; x=1793607953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xQwU3ZXVkpG6YMTBCPOnzgaVBcLxcmMgkLkbyRVzIw=;
        b=CeDkfV1XfS/6dRaMvzJ864AaRT5CsTHHS5gc/xeNh33mV6z7lrAobckfyemgrFQKK/
         FxrDeQE8cgBFP+Mg21zUJD/qwXJeBTCE2on3OLuBLKxXNY4ux4tgmW3fRiVcur4TLief
         9CsabOFBoS8lrxQTB77bVDSmlgUw+jN0+o9T53xNxBeKWPmaauo7c2wHm3lteHrR5q0a
         6czWLZ1JN/hFs08xV6RUUHGoyf55R7wRstwyI2RvsChABtG6McWDEFpJANG5XGaWuXBW
         eijYlPXYiPQ/r8/OxCducJpQgfcDNQEXIio6hSiwrWjPbonXcgcSXp3VcmYr/ZCV/qem
         U4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003153; x=1793607953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xQwU3ZXVkpG6YMTBCPOnzgaVBcLxcmMgkLkbyRVzIw=;
        b=hsOj2si63tQv5va2C6TDzHFnuXGlurilQNGo+DCffLQhjwMcAtZcW0xa0V4NZHewys
         KfkzNfonKm1vEfSeArgIRP3AYEspYFZojaC/cdrUUv1tx0oUVwvp8AvgOPNdUvldwxJG
         RfaqMkYkefgXxyi7oMYDf8u5sOuFCMBSk9S97JhlrlIm4u3MGeMYotiw+4o3SHrhx5Ei
         T+RWIP50yYvOQeZEHQavZTWrSVP6WhhgpNrgm5xdxvkg/edtTa4jool1rN2mKuQgNRr8
         5xjcWBo7lI9mDw0ng+xguCXlCsOJgg9mqkrPJQ+NVUB2X3IucK8cBM+eCY9hFzQJeG0g
         ShGA==
X-Forwarded-Encrypted: i=1; AKwUvBz7VXqJ26uiVh6eXNilYFFJVKoE/ycRdDYFUrFLZZV1QBfZZ0Ogx8mGClEg4qoUImUBd6ilXhPiOX4TjzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtZKumCwATNzi9dEpucBApVOwQghO7e37Gr0ENgNkjah+WGa2+
	Ql2x4sLLpbLrHzlsd+PgwTCpyEr3YIvSPgcEblSubPTZyY7RC0rp+eA=
X-Gm-Gg: AYBFou0cZnACKMv6CLTeNYzMXNxflUZaD18+CJ3ZBxlIR0NdJj5gnWI7gLal5Xbjh8L
	vAFhlz93iEPvhgpzV0OnQzS6U5RzBxYBFwcUP3IvfuFVGxVJGfbneEJgv2EWbLHv8UWwIl881dq
	9jMFPfuvOp+9XzD5CMJhyxgMVckVNDlPt1iacy6oULP5hmcpwCKi8c2upE9M03mKxs0t4MtiZg9
	0YNej4mdhZrzrUnojmuEzVhsnmnfEpfd4/oVWJen1nyRspAzLlM/zQsmt+9baLa2nZgrnD/o3Gt
	+6ScUJUeQvbBwuh5VuQrihQt1TttJiRdcDr1z9MYeu0MIpHFHa1Fn9g37LKBFEOmxVC/V4wdB2u
	qcFxpfTbzZJhS2FcPHxZXtKT/1oDevhsszu/cOjkraSYvrUj4vOz2eQrO59Gf+0kGm7emG2q50J
	Q9HINF12YpDll3THueIneWKmOvcRe5/gPqtcwNzTW1iaxhc/iHw7JH3W2rvHf5rCeGg7Ar8/xtm
	mSsg6QPzPjPAUfa1hNHeql8BHLS2aHw9XG1h/M0SohwcaO86WtFJQAQocyqjlM2x17iP3zDpmxU
	k1X8GOH+cil5rYxMCg5glpkLi23dfrftwZwN
X-Received: by 2002:a05:600c:c173:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4a35acb9b05mr94608505e9.35.1793003152709;
        Mon, 26 Oct 2026 01:25:52 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm211058215e9.1.2026.10.26.01.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:25:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	fernandorimoli11@gmail.com,
	lsa.uz@pm.me,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Mon, 26 Oct 2026 09:25:47 +0100
Message-ID: <20261026082549.662885-1-dmanresa@gmail.com>
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

Hello,

v5 fixes a reference counting bug that 2/2 had in v4, and carries
Fernando Rimoli's Tested-by on 1/2.

A correction before anything else: in v4 I wrote that the Surface Pro 7+
was leaving my hands and that the patches were compile-tested only. It
is still here for a few more days, so this version is tested on it.

2/2 as posted in v4 dropped the reference software_node_find_by_name()
takes, on the grounds that the node is never unregistered. That is the
wrong half of the story. software_node_notify() resolves a device's
software node through dev_fwnode(dev)->secondary, which the IPU does not
have yet when device_add() calls it, so it takes no reference;
software_node_notify_remove() does resolve it on the next device_del()
and calls swnode_put(). The reuse path has to hand its reference to that
put.

Measured on the Pro 7+ with a module that reads the kobject reference
count of the INT343E node directly:

  v4 2/2 as posted   4 -> 3 -> 2 -> 1, and the node is gone from
                     /sys/kernel/software_nodes on the fourth
                     remove/rescan cycle. Reproduced twice.
  v5 2/2             4 -> 3 on each PCI remove, back to 4 on each
                     bind, over 16 cycles, children intact.

The decrement happens at the PCI remove, not at the module unload, and
only the IPU node is affected: the sensors' own nodes (INT33BE-4,
INT347A-1, INT347E-5 here) hold steady, since those devices are never
deleted. A remove that follows a failed bind costs nothing, because
there is no secondary fwnode left for software_node_notify_remove() to
resolve.

The series itself, on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19 at
0000:00:05.0, OV5693 + OV8865 + OV7251) running 6.19 with the equivalent
change:

 - without the series, the PCI remove -> modprobe -r -> rescan ->
   modprobe sequence fails exactly as the 2/2 commit message describes,
   with -EEXIST, and the cameras stay dead until a reboot;
 - with it, four cycles complete and all three sensors stream after
   each one.

Two things that cost me time, in case they would cost a reviewer the
same:

 - modprobe -r intel_ipu6_isys intel_ipu6 leaves ipu_bridge resident at
   reference count 0. Without an explicit modprobe -r ipu_bridge the
   module image is never freed and neither failure reproduces.
 - the reuse path logs at dev_dbg(), so it is invisible without
   dyndbg=+p.

The asymmetry underneath this is in drivers/base, not here: a software
node that becomes a device's secondary fwnode after device_add() gets a
swnode_put() at device_del() that no swnode_get() ever matched. I am
accounting for it in the bridge because that is where this series is,
but if it should be balanced in software_node_notify() instead, say so
and I will send that.

Unrelated but worth flagging: Sergey Lebedev's "Add the Surface Pro 11
infrared illuminator" series touches the same two lines 1/2 does
(dev_properties[3] and the "lens-focus" name), so whichever of the two
lands second needs a trivial rebase.

Changes since v4:
 - 2/2: keep the reference from software_node_find_by_name() instead of
   dropping it, and say in the comment what consumes it;
 - 2/2: commit message notes the reference counting;
 - 1/2: Fernando Rimoli's Tested-by (Surface Pro 9);
 - tested on hardware, where v4 was compile-tested only.

Changes since v3:
 - 1/2 and 2/2: commit messages cut down;
 - 1/2: lens_focus moved into struct ipu_property_names and link_freqs
   into struct ipu_sensor;
 - 2/2: reuse-path comment shortened.

v4: https://lore.kernel.org/linux-media/20261010155626.2766298-1-dmanresa@gmail.com/
v3: https://lore.kernel.org/linux-media/20261008132614.2456716-1-dmanresa@gmail.com/

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 34 +++++++++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.43.0

