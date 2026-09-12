Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D2B37FF6D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200653; cv=none; b=m3SsVBqRZtaipDkcNpKBd9+EGUKGAV/C/4jJc5b/X4fMz0AJJqE9Fjzkc0f5pOVU7k9pWqdwSy0eDbDrH1iYsC/G9xr8taQXnE2vlFf6aD3yrusYLsAmRZIpwSjDSm1TQurfli36CcUVbxL1ggUuDHFTJyAPEVhnis+SMKuLIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200653; c=relaxed/simple;
	bh=PEAuDrza3Y5SfFxch680LxNXRvad81aZFzbJXkuqqNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJSKzYFHnaJOopktCWTY6kAIo52FzW4GW589H9nf7Vxnqe0a4A+F2rvKQSRzsrlPewuRdXSvKMyp8FjvL3vWZY48URUOKxFwqQDpUXN6g9fSNocBFWYT5fjmzm/kBVkoR9cRqwBDIqeunjnJ9BCOBvkR6IHV2bbqjKIiSy4CZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdLdxd3x; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdLdxd3x"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca069c8so3066315ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200651; x=1789805451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GoExsibafFWCOKZx2T64mk+4e5+1pi6zhVko5O9cFc=;
        b=PdLdxd3x82JHgWwp9kLIMk8pb6LAetk/Dm0o1OZ3tMue1Jw2ciaKQB86dxM+weJJqd
         T5YH3S+2UrLRLoAuTqqGN/98GdyUz3sFLFwR4R2rHtqOc6MITT14rjk47KvruJ8eW/a2
         6ODPmiACmbjwVSnpKpVchcFOjEHvCKhXMWi0n5v5uVNWAf3zxyZuyyZzF1cfN+kXhugj
         rfunve3bJtSZKq6ZZlFUGdsMPQF3ORUc8to7pghCo1/8TdMoiurCHwqxdydYvxhTYFBU
         b6LquAlJhb+CSE1y4AGbOhHbSe/TtUiKG9z+Enhhh9zGvm3P4WlLgfEPbA8VpRZMd+4B
         63DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200651; x=1789805451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0GoExsibafFWCOKZx2T64mk+4e5+1pi6zhVko5O9cFc=;
        b=dRcNyuoESrdRinZTWaWBKXoVqM4l5iP8xMRihWlruxpetf7fPyHABvE3t1cq+cFImh
         8pBY6xZ2Ae58bJN7kcJUBHNnvGwKYlDzjR4by2kcWo6em9SopflAsZiNqIxdlGeVG+yB
         oDMJaL+71ESuknOvFxl7vuNaHLl2dxWoRpNktijm82Y+kCRBImGWEpecvZ8ewIqgmbIN
         XbmvTtFMwKzCAZmP4BGnYQd60az1a/y5g4j/OVdL5MYHrxwMVf2SLxtN1Eq1/yZQYEOQ
         nP4UNUKveP6lrL/5oURJfN8jGCu492WI32wO2B8dDtmS7cKQSYj+A2oMNJl/84X64/sC
         3IAw==
X-Forwarded-Encrypted: i=1; AKwUvBwgL2gV6gvKanICANoPklpt4u/jsqYjl6KtNadhnKOYRtR8Xal3hsSgw1Kt3kv/O44USwJcKmG+5oL3WXI=@vger.kernel.org
X-Gm-Message-State: AFuF++n+hk5a/toaRB5YHpxNCqLIM7sNtqzKgpFKng3nJ/hQ7oJsoc5C
	YRVPAhc9QM7cvgOJi8whU89hjAmzqLyUNJNLgoX0EubkaFyZzco6vBkG
X-Gm-Gg: AYBFou1NUJoQnGSFiIrJBbQD450S0YrCmYCGlAdve46kKBxIomFAiXMAaczcINLau2N
	eqXp4dXknl6GyMnxIWC7fqAVZVS3SokxXp7qMnT6jqA4mKepgQzPRPBTpX905qxpkU7i/2ceD3o
	2dm1j+65rAz3SlA/T2phD5LpehSmMoMFIYG/yv1+DBuGSoDic7UfAEsfRxGEkeOszXKXeXGVlaC
	aLVl56GvGIOFOpVZbgdh0Yp6A3ydgZjgNQ4ZyySKrK80+G0a0XeEhqcMQ9hoxbZRRqGJerw+mmC
	r/HeDd9XentsDbwRNkcF47wRCXpLp+WNDQR2sd6X5YJG6csASV0YQYLgqX03sUnV0popysH0vg+
	W7Epgg9OD74zNstEK7ycaSS7ixxur9ICVQx2jj8yS/2Ge2xkp+Ni14cMcbidPWPPXkgQTgQO5kK
	E6G5cTEIHyx4Qf5w6yoY6EPccNDptYVyL5Fxg2g8XI4RZDIUOAP29eCQetjrs7YNJQL/vsPNtQz
	PvfyDkpLC/LxuWVBL18Xku6Lb1d2nZjza4e2csgDF4auZOsEkIfwFQIb1u6dM7HkUj0OW2gNmpA
	6lnfhcah8gCzV3mTBoN25XmllaP2QeLui9HiPHGRjvs1
X-Received: by 2002:a17:90b:1d82:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39dbbe8b88bmr3419988a91.3.1789200650925;
        Sat, 12 Sep 2026 01:10:50 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db7ae6d25sm982474a91.1.2026.09.12.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:10:50 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 4/4] accel/amdxdna: check the command payload before using it in the exec requests
Date: Sat, 12 Sep 2026 20:10:12 +1200
Message-ID: <20260912081012.2274075-5-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912081012.2274075-1-0xiviel@gmail.com>
References: <20260912081012.2274075-1-0xiviel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aie2_init_exec_dpu_req() takes the payload of a command BO and subtracts
the fixed header from its length before establishing that the length
covers the header at all:

	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
	if (cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
		return -EINVAL;
	...
	dpu_req->inst_buf_addr = sn->buffer;
	memcpy(dpu_req->payload, sn->prop_args, cmd_len - sizeof(*sn));

It also dereferences sn without testing it, although
amdxdna_cmd_get_payload() returns NULL for a command header whose count
field does not fit the BO, setting cmd_len to 0 as it does so.

Both work out today, and for the same reason: cmd_len is a u32 and
sizeof() is a size_t, so the subtraction is evaluated in 64-bit. A short
command produces a value near 2^64, which is larger than the payload
field, so the test returns -EINVAL before sn is dereferenced and before
the memcpy. The NULL case is caught by the same comparison, because
cmd_len is then 0.

The guarantee is therefore supplied entirely by the operand types. A
later change that computes the difference into a u32 first - as the
sibling slot-filling functions in this file already do - would truncate
the underflow to a small value, and the function would dereference NULL
and copy from a short payload. Those siblings, aie2_cmdlist_fill_dpu()
and friends, all carry an explicit "cmd_len < sizeof(*sn)" test for
exactly this reason; this path was left without one.

Add the explicit length and NULL tests here, matching the siblings, and
add the missing NULL test to aie2_init_exec_cu_req(), which copies
cmd_len bytes from a pointer it likewise never checks. No behavioural
change is intended: every input rejected by the new tests is already
rejected today.

Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/aie2_message.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 3028968..ab9e7c4 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -556,7 +556,7 @@ static int aie2_init_exec_cu_req(struct amdxdna_gem_obj *cmd_bo, void *req,
 	void *cmd;
 
 	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
-	if (cmd_len > sizeof(cu_req->payload))
+	if (!cmd || cmd_len > sizeof(cu_req->payload))
 		return -EINVAL;
 
 	cu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
@@ -578,7 +578,8 @@ static int aie2_init_exec_dpu_req(struct amdxdna_gem_obj *cmd_bo, void *req,
 	u32 cmd_len;
 
 	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
-	if (cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
+	if (!sn || cmd_len < sizeof(*sn) ||
+	    cmd_len - sizeof(*sn) > sizeof(dpu_req->payload))
 		return -EINVAL;
 
 	dpu_req->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
-- 
2.53.0

