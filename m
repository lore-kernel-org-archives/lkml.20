Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3C74F4759
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484696; cv=none; b=u1FcK1P8SL0ohBJr5sHiC64Fu4LsJtTf1a6Wz6pCOM2/Wyk5wezGcSbFEiq+EtsQBE1BEi31+vMCDR/THs53OU9q4TIWP1nt0PNTrb8JIFRe23ttfDpmBFL8PKABoUEDWDWxHd4UiPahPKJ5538mihJINw815zgG1QICtJlvVw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484696; c=relaxed/simple;
	bh=suAC79Lb92vdODjVsBBG58aFPRRoscz21TCCDZVGmFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qwcjx9W89JNkS6mLZueCTNh6PbDEHnLNneSfsWPnU7dtICx0irFghJwNVWKBr+V1ZNmF0hHAQUPPO3BKb9X3pMlWLQrVXZE4luBc1RIbaLHREv6T9tk7vYG9Xu3gtUsJcetfiwM7ql6yo/S1PUnpFFozTu1YVwdUKToGRxsQLec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiA/HrfC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiA/HrfC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso28783145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791484689; x=1792089489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhdzuOviOybOfOdxdwALihDABzSCdOjxs/WfjtGrXrM=;
        b=iiA/HrfC5mJbNgDDKCGkMSVDyTi5Op7URF7mB0vKQ3GegdZWRTXllCIsV/EAbZTX1B
         MdzsOMqJsCCjGyWNOF+kqQNu7HAhBlbfpDvexOL1+IZqH1prQ4+rvIPEfGiNmYiiCOdN
         P9JnbJvDMIom7zeKI/sgAsPMsM98GJ4jkJXjN663U/AeT1RrTh90oWnHNHAfJIoXnkxA
         4QPqfWSyZv/sMXkrm3f42FdyWpe+rqSF/6xtLFXgNNcZL1Ucp7RGo6qgdtc2Q5dzX/nE
         HAupAEN/wqd5ZfpwFbbPG0QbXxhBh4PiMGT3ShIHPhQUn6hZyIwlgIcVWLnGNLZvxmHH
         R62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484689; x=1792089489;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhdzuOviOybOfOdxdwALihDABzSCdOjxs/WfjtGrXrM=;
        b=gQM6mhY4u1Xuvn3Qc8HhK1QT7fGTYkFgL2yw6IkfF8zRpvL5apZUTR5lIQfeZ0D6SJ
         3eZE9P0fVAPGwa+7h7q6QHLcYjR9RgBih58Z3VDPqdOwcDvW825JZB5h5TRXb0nRUB4n
         YJ7HO8Ik4KXXI39Ttls7UeyVgX6xfr8D8HxyVyFtr6cRL2XLMdPNPUsU8fI4oyUM/LL6
         R2zMPrUsBxxtbfHv7KHmYfEGRLa1f1GGEDA3VlHx2lp53pyMVwJddt5c+/HlzywMpvPR
         QrwB1JfIA5ODO+/F07LmbJHRFava9fzluFtKiIP4jwX+CTgjpR1UYvx6brTI0Fq/Rb3K
         vzwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIgnXo2uDArbvHb8AyKdWSkrg+z+vZA3KzAfGSLQGNwZVOAF+PzPrMRDv9FDjoCJ3dVA+z/pArNXlkOwU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRUCX7/i35l1s8+BgHe5dAICV6fsrUy9uC5S03sx646Qz3NEDU
	SyWUFUZMXBnsqroAdxLnyrF2lfjh4pasjI2KynOrOYwPVbJOFgY/+b3f
X-Gm-Gg: AYBFou1ApgTAF19RFIYWbPDJU4zAt5aejDE2CdiOw3RUeoUJ8BS/zl00IenMDsKn9nn
	Pbx5tOOSAabdTzxzpQJfydBoDzM48bOrY6QjfEhcEstVKmRvQStpS+23Z1ruIi+ND7ULx+NqwLJ
	V420jv5WtVeViKuFEe3nKRWrSOPIqav8Ina7lA0k1tuVrQRqK+BKrxLR7dqi5nh0z9bM2CZ451H
	L8Ml57Hi84wzPUSQDd24Npy7kSlwnu/esVS111XUNAs0+pKj/jD8cKntnyoCRcGBfmuR66vHKkz
	DMilcLPE+OOoYhtIROucQSDAQ9MuCDScXlbLTjw3s52Huy9KwuqcowUyQrSOiR4lI1P9A43DTci
	8pR40zvMiJYboQmZcQY6d1c1S0cuOb8n9rfblb/YJ3KWK3TP6/mxG9NFlJYdMUh95ff4GRcW6JO
	Q2QKcegIq1fEUkApKMdM9+3TQvKtFMq/kf44VJ3wrED2QUZ85U6mnnPnpLQ3g4hH7pk4l48hPr3
	vHoudmpZ1JBtrV5Cbb/jAyu6wTOZmXqxzzoOz1JniUw7OrA/PpvQpFGbA==
X-Received: by 2002:a05:600c:4e03:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a18064c31cmr105908565e9.15.1791484688923;
        Thu, 08 Oct 2026 11:38:08 -0700 (PDT)
Received: from localhost ([159.26.107.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbfc03sm2413385e9.1.2026.10.08.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:38:08 -0700 (PDT)
From: =?UTF-8?q?Dar=C3=ADo=20Hueso=20Gisbert?= <darihueso21@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Dar=C3=ADo=20Hueso=20Gisbert?= <darihueso21@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] selftests: rtnetlink: skip ifalias test if uuidgen is missing
Date: Thu,  8 Oct 2026 20:37:41 +0200
Message-ID: <20261008183742.678-1-darihueso21@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kci_test_ifalias() uses uuidgen to generate the alias names, but
uuidgen is not always installed on minimal systems. When it is
missing, the test fails with "uuidgen: command not found" instead of
being reported as skipped.

Check for uuidgen before running the test and return SKIP when it is
not available, as kci_test_promote_secondaries() already does for
ifconfig.

Assisted-by: LLM
Signed-off-by: Darío Hueso Gisbert <darihueso21@gmail.com>
---
The commit message and the added check were drafted with the help of
an LLM (Claude). I reviewed both and tested the script on a kernel
built from mainline, with uuidgen installed (unchanged behaviour) and
with it removed (the ifalias test now reports SKIP instead of FAIL).

On that kernel the unrelated ipsec_offload test fails with and without
this change.

 tools/testing/selftests/net/rtnetlink.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index 4843d474538f..c758efb734da 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -412,6 +412,13 @@ kci_test_addrlabel()
 kci_test_ifalias()
 {
 	local ret=0
+
+	run_cmd uuidgen
+	if [ $ret -ne 0 ]; then
+		end_test "SKIP: uuidgen not installed"
+		return $ksft_skip
+	fi
+
 	namewant=$(uuidgen)
 	syspathname="/sys/class/net/$devdummy/ifalias"
 	run_cmd ip link set dev "$devdummy" alias "$namewant"
-- 
2.53.0

