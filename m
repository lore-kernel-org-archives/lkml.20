Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255217;
	b=EwfnMTNe1xo5ThyCFbqmN45kNzX+k/wma/5kEi/4QVW+W3GCdXPLnUkjkwhjFgn7tZ8r
	 rInenznFi1VT1fOr/6QJ+TcrCrxPDyVwIbulPTtaTtfa1f0lp0BMmLEjVVUYaRJSN8KrK
	 J3OUnZlttl1zw70TnW62GPFdWy/yxSc2qKKYrm8RyY2HOoOEqqsCMUElRzcLW+vgRNllF
	 9SuZi4Gf4+LQTZPb6aGqP5qNeA2H+ruf6xBIRIYim/pBHE1OltyYzwS1hItKJD5mPCDpq
	 7R2XD+6e4uv+hLGHIANxImC56S4fPldP33L4bahfRxo0c61FWDpbJDuEx4cQDExlDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uEUhc0o+zUeX7PEeAhsV85l+vCP5t8Vwwg/hq9Oboac=;
	b=rmZMpKoyJDv+hukoOw5lUyFGApxgM7KqLXE9NuavjDInaNa6fmMsM5K1nqLJJTZvrlvW
	 eO95uSQJqDQtObqQCZFXlvNeJr/6OmyBFgM/9SRXBhhjQdraVAr38iyzOT8XIM2LlMX/R
	 W97l45ejHhG+SjW/y9xoBX0Ycb6sB28C1dRRelsiyeNBV6bBYbOG4BvzuQy2GIfruWNJq
	 EQui50nPzDkXlnGjgW3pWM5hW9OICpqwBh3oQKuYd/W2gvEDFE0Nhcisf9IQZIp2cjK/S
	 Xt0vVzHoZqz6JVvgRKWxEG1GmXHPbfNex1zcXJ8N3R0DTy2pmEe3TJmjaPqd6VlaE8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Eg/ug+vY";
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA20B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eg/ug+vY
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49814d35686so761915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794255215; x=1794860015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEUhc0o+zUeX7PEeAhsV85l+vCP5t8Vwwg/hq9Oboac=;
        b=Eg/ug+vYD0D0AgnIWS1dNzLSRWyESktrtjplWdOPjXBJgMBMUIubipYZmoDoauUwvz
         /dZGsc6EkttNs5bk+GFenZxxOQN+H7M6Wl5RBI1b9qEIRIFKL+rgwqOlDbgERFKahL/9
         G5dez3qdZ3nGiGMgrM4QY8QQkB9mWgS8nvPMEQSHZj9MsIpqX7roNjOe5JtIyM5ZzRi5
         k6oCSCEo2RxEony4RPbRrLfThs+geglFdhqQA+8d/tTr0USjaaGBoQfVwcI2I/PR4pY9
         AnrBnsqAYUJmk9xcQAiH3zwEPQEZA8ardfjSoJhiO8tSLEiTCIoBC5h8C9aIeRpP0hbF
         mYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255215; x=1794860015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEUhc0o+zUeX7PEeAhsV85l+vCP5t8Vwwg/hq9Oboac=;
        b=fTZdqVOL5kzdcPDEZtSJoYDFJX0+Vhw3b/EWpfIRZUh4suOnKMmCooutVlJdrPS9b5
         YrGqyAU1yPaO2MtyLBE/+2YTZLwEZjtucEfrzTw5+3YktTwxDrKSyDtUXtLGjH6Zm/Uu
         4qENQD3L/yxC+rdrsCYzd89AvEQwjPUekhtCbgizSLwII3ZBMjna4kronLMmAZnQTxu7
         hck9qsym39B9jepT9bFL2aE4sAFi22uZizh5hPpd1OVBYvZuMeUB39CEacRD9XNrUm9g
         QTlI/gfl3jvswKjc2AquW3tG1mODQ8o6BveZ/WadST/Ohken+e9IC30u0NMk20WXNbM9
         +jHg==
X-Forwarded-Encrypted: i=1; AL+hErGCaO+qdcsEgwGIRbXMhNuRZfBVKKkaV4pg3hx6K6txlCKRUEuSTuTmxoXlZL4d5r9XuITcYN39Grgfd2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tB9UShyE1UnuSsCK3g/JiOCdpQc5rMiJBFvw6tSgYVPtB4oIe
	IaDybbOc6cNErBc0pNsi3+PHWritcc5B8EIdaMT+2s01eI+O7mrDCDw0
X-Gm-Gg: AYBFou1cAi7hFd4vXXhFCanFcPuS13CtyUWNxthoYl3rmgYK/te+GhcAi4Sp+/ZNhTY
	nN+2GhA9nCbH6AewU48mkGKJTK8aHQwrosC8DX0j/BEpWojUlSHEeH340j4LUP+4zJKT1hjY7r2
	/cNSyp6CXlH14fJ5iIP0RRuSSCf5j0HiUd5aPv5dx8tsZE3x0c47R8Jj4jy32/CXEDOrSi/Q7vw
	x8XgNsXWmQ6Pf4LZ0PKu5cRqypNPD2dSdeoQyx/l3u6nnw7yvB9yEB2V2D87l3rQ9j5u/DUrrmR
	OCg41CBW44Shfqq8fYt384rUFvrU7RL0nrnbA+3wfOUpVS3mhVC8wLT+8FJpvGHGTkobJFV8MII
	iaoTET6icxatRI24IhMSfBHs9oDzj/HQJpTx+yqZ5bU9ehe/cv6T6OWbaEkgHwhfsLUpQZgkyMy
	og6BPAiYZvQlxDK324K08wN6MoOkq08BXdmQ2VN4+q+1Gpd7RK4vKQaGdssid5fE5Zxmprrvdad
	c2YHWmSoDA/twPsEecVuK/ftvZaDLczjcxTjWWKQZIfxAkUYW/bYBn+WK6ZnWEun2UD2uHrVsBb
	QlUFRffnBibtx5eOcsw2fHFwqGssXTsQCE7JtQJ33z8HLw==
X-Received: by 2002:a05:600c:8b2a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ba02351468mr5057055e9.16.1794255214985;
        Mon, 09 Nov 2026 12:13:34 -0800 (PST)
Received: from serhat-ubuntu.home ([212.253.195.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm18441715e9.7.2026.11.09.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:13:34 -0800 (PST)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Doug Ledford <dledford@redhat.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] IB/rdmavt: Call check_modify_qp after validating QP attributes
Date: Mon,  9 Nov 2026 23:13:02 +0300
Message-ID: <20261109201302.14531-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
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

rvt_modify_qp() calls the driver's check_modify_qp() hook before it
validates the address handle attributes with rvt_check_ah().

hfi1_check_modify_qp() uses the user-supplied SL in ah_to_sc() to index
ibp->sl_to_sc[32]. The SL is a u8 that is bounds-checked only in
hfi1_check_ah(), which runs later so an SL >= 32 causes an possible
out-of-bounds read.

Move the check_modify_qp() call after all generic attribute checks.

Fixes: e85ec33d820e ("IB/rdmavt: add modify queue pair driver helpers")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/infiniband/hw/hfi1/verbs.c:1474 ah_to_sc() error: buffer overflow 'ibp->sl_to_sc' 32 <= 255 user_rl='0-255'
--This fix relies on the SL bounds check added by commit 0dbfaa9f2813

 drivers/infiniband/sw/rdmavt/qp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/sw/rdmavt/qp.c b/drivers/infiniband/sw/rdmavt/qp.c
index 3602b9ff2196..abd33f42c888 100644
--- a/drivers/infiniband/sw/rdmavt/qp.c
+++ b/drivers/infiniband/sw/rdmavt/qp.c
@@ -1422,10 +1422,6 @@ int rvt_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *attr,
 				attr_mask))
 		goto inval;
 
-	if (rdi->driver_f.check_modify_qp &&
-	    rdi->driver_f.check_modify_qp(qp, attr, attr_mask, udata))
-		goto inval;
-
 	if (attr_mask & IB_QP_AV) {
 		if (opa_ah) {
 			if (rdma_ah_get_dlid(&attr->ah_attr) >=
@@ -1521,6 +1517,10 @@ int rvt_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *attr,
 		if (attr->max_dest_rd_atomic > rdi->dparms.max_rdma_atomic)
 			goto inval;
 
+	if (rdi->driver_f.check_modify_qp &&
+	    rdi->driver_f.check_modify_qp(qp, attr, attr_mask, udata))
+		goto inval;
+
 	switch (new_state) {
 	case IB_QPS_RESET:
 		if (qp->state != IB_QPS_RESET)
-- 
2.53.0

