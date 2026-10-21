Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586131;
	b=A4AgFRbhWCcGYkTJmpRQKLx4qpxkMJSZ/eSDMO0Lujt+o7iwZ78qeqnnV5LBM0tUYgiI
	 F4vE4EY61fmciAbNfRdZC3GWUdhR9xmA8drgqdJP9AVaR3Qy2KngV5/2SO678/H4N+HMP
	 63NNHdcKvCKbTtJk3DoIGrwMchPwgWeG+UBN2/ruqjfflM03vExe95teycJid8O0SnYgg
	 4f3TF3xdDpSMR2j9sOMG08Ve90pC59F8sJ2Xe0QhiBbwO9lVtWZWK3REsZRAvlgyTLCpq
	 CCcN8e+x5tmJ3kuJQq6q61LmDL/2qRVAeY8kAXfSpOaNz0bFyNQ+v8K4G3suJPlt0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wu1qxZELmS9rWT/CuocSgQnLIE8sXZ1eUSoJrMvKaxI=;
	b=vyexr/kKKXU94scKLCP5NKIZpXkI1ag4tdB2nB6FEs6fRjepxzsQXrSuOPKtYFUQxIeZ
	 VpNv8nWhAYJh+fh6IXbGZ0PhaZK3ib64O1TEA34K/Kxf/vl/QnLDiv8MolR5m9F6QPlqe
	 2sU/Av7aKigXcgRBsheJS3kj020TVTYl9c42pMKlh2s0iahZCt6VFcjkfj7DrEuG7Wfjr
	 58DbL5vSBIkF/i8d74E4EGgA69rlhCoYrAoK5fQ28DWIIraDdxAhckC7O02+3+iszGoGV
	 58IWFB73+m5MQeyr6cXoI6ZxELoIsvGrywdRxA1drBhjDEmf2YwQ6LoTSOwAKhQDvPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G7D64tsG;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8D606ABC2
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D8D606ABC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G7D64tsG
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd3310348d2so687809a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586131; x=1793190931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wu1qxZELmS9rWT/CuocSgQnLIE8sXZ1eUSoJrMvKaxI=;
        b=G7D64tsGDl66QqN8Sz1fWlom/DCu2eemXsPvx8ILE/DFYzM1apBcPN7JF9qZ25MurD
         6mNITetmZdNE9pTP+sA/vxzC53MLjBAoHcMbUTl7ah6OrKfhlLK+jvwhYlLI5Vlb0uhu
         1H9QOHB+4J7OtUg/Kkh/u6mUY+efs8jGigG4ZSHPH6zxe/NJdsL9AsdaHdKDNks8OHS6
         Z41esGAP6zSqGyNHUE5XCzTLfADGrK05TSpjlTIOiAAcCbwGNluhijsUU89xZvblCy5c
         pEBaO/nwtAu4opN4lBab4E0QYpiPjXltPXNVD5ENKKd8cDFl8kJtMeW6t2wo8nrW84EP
         +kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586131; x=1793190931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wu1qxZELmS9rWT/CuocSgQnLIE8sXZ1eUSoJrMvKaxI=;
        b=dyXTeoJ6Gc70xTgk3ydjR/ILTtzi6OYIAnHFyQ8ktAiDKuUl44ZhvWk8+r7HH5CtZW
         2gq6VWcAK6P87j+DCyOcHYW3JWoD0qARMBz/ZGW3bCzFWoKzLOfXOHRIpOrx8vdiudLX
         mKgAxFsTJO88aPbJC9ZLXfvQXM/oL77FJu62V4ih8bjLWvdas6RuZVTXUJJXjRAfHj75
         fLkr8T1LdzlEWqzapvzNWFYigBn3THoUqNOoMDR30h9hsatM/C2hH5/fO0eP4QWLdZS7
         FFDqPDNvWzT8uuFyaGXBOxEFo+hQBiAT2Drl+SmcOwN1BxIB2dkuFwEpzgvrh1mNwoT1
         6ruw==
X-Forwarded-Encrypted: i=1; AKwUvBz8Om7OivYXNrtLpUfJ9wU98nneST+Dc60Oc14kiNrQtyNMJu+1e8qQaiCl+vU2If7rv8MQjjq27RlgAUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcSnH3r1CSKXi2Qh1D+NxvWCVZRpoVZmI8bXJ2D/Jip02VN8A+
	uq3jmn9swWWUD5BAU+38iFZcJEz50SoavdX7cYKBKA1LlLWLXLTyfE5U
X-Gm-Gg: AYBFou11tkNnsPdbzx4CpRN1ZAt3+wSrKFhcOdz+m9LFythRSay+5hxqDU+UuMKk0nN
	6nbhKgSJ94/brM1tLE8WH2Ft7Otkm/lYCBmFgRS9ZrPmDW21sZoT7gUPG7HZozdDTyRa1VJjBys
	VqrOw/B8CYrN67T36pFrZ5J8MJnkBXzJcATOQk8CHuJ88UIOz5169CBAum2IZLF4iTlQ+leKRdQ
	M7MwaEZ4CpTZMH8MDalsERVu3Mz5454tqZemmmy3ycbKc7qSQq6YLo8WfXAVbPiET31cW6sjqUJ
	vUjGrQYvZcnp9TtAgg1I82hQZ0VqAupYqVpsG3tD4aEk4/A7pLrLFepGHb82GgUaZP2fBv1Z32G
	WrHbZo9JuwssFvdwdAJDkzvI+4jR3H5l06PtUbJCLHyPLblR3iHtfDo+FGC6/xnHLv1LKXjY3oZ
	Tu8qA4tymLFyHBAqisiiHAGlljMVBMTYQ8sEx20IwoftCIZJqoK5/vwz/rZ6qlowcPgMehI/ffv
	7Q3q8nCqe8R8DpA8XxCklgkyF2g/vK+iq9THOiwwrlt8ygaxvjgd6+0
X-Received: by 2002:a17:90b:4c8b:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3ad86ec6e0bmr1005629a91.16.1792586130463;
        Wed, 21 Oct 2026 05:35:30 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:29 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v13 7/7] platform/x86: bitland-mifs-wmi: Permit zero on SET functions
Date: Wed, 21 Oct 2026 20:34:14 +0800
Message-ID: <20261021123414.25516-8-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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

On Bitland laptops, the ACPI firmware returns 0x0000 for the function
field on SET operations, while setting the return code to success
(0x8000).

Because bitland_mifs_wmi_call() expects the returned function to match
the requested function ID, these write operations fail with -ENOMSG (-42).

Allow a return function value of 0 on SET operations to prevent false
error reports.

Fixes: dc1ec4fa86b2b ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index f4f37ae2f424..a4c341ffbb9b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -258,10 +258,14 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	}
 
 	if (function != input->function) {
-		if (!(data->quirks->accept_zero_function && function == 0))
-			return -ENOMSG;
+		if (function == 0 && (data->quirks->accept_zero_function ||
+				      input->operation == cpu_to_le16(WMI_METHOD_SET)))
+			goto fn_ok;
+
+		return -ENOMSG;
 	}
 
+fn_ok:
 	if (output) {
 		output->return_code = return_code;
 		output->function = function;
-- 
2.56.0

