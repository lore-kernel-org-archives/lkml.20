Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46693261B8D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247205; cv=none; b=FpvXk/rKO6Gdyj4smrmFvnOdMjoxc2K3k3QrBMxHGY42WdvuH/YSVDlQ/dHv4gEiUdSSwXnKH3v9lx47KKUX9OvnbvQ7fAXaPCGI8D9yPo2MEVGQGOKry0KGhC04oYYtlRvLsG83WK8hrzjPVmJFUW9Nc4gl2tji3gi8zILQj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247205; c=relaxed/simple;
	bh=cZPXtLBEO+nIR8AdAKN0AqSZ1s75QgRTXt/bK7/dtYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMtFX/FA+vNPe45p0m32Ai6wsfse5RCXQtnEMpJhIXBv45RxkzePFG5zG3coA9H45LFxRdHUEVH3/bxK0bOZy1QZgIcN9rvqyyLsFMW4EOe6A8EkvCAwvryW6WWxLr5eM1O0PJPl78nAFFWaDhBGOZ6+K/5HiNGqFfq6hui6nCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/t6oz47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1cpFNFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/t6oz47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1cpFNFp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN0DS3299820
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 00:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPry6s0/eZtpQh6W3xcXutov9SeCo8ZKZHlB3Z0ToE0=; b=I/t6oz47z/G8fqAC
	8RNzbOdJNfGxeU3HWlRFL7iYn+FoSZ0qLqZzyxhL3nxL/xQckIYUPOqMBm8EBwaM
	+DJK/O/rWzc31923V/F8rCDMOEQB2LuWu5PymJKNtzlY7QQytugyYtB/fQ9rnRN3
	WH0OHaOV/8+kn/DhrDOhgLrSqtX6TgTcZdwyj359W21cNG1s3I/LKiWMVytxi5R7
	7jzPPAwrpHFrzSeONhSYJexcx5lwVYkUDbamTseuakvdRRBSM4OR/YPlBlGbpZiT
	AGADfHWbxutC9pcKX21B/OIqZ7Azm1yUxizXJhTJA0hRm3kzxCthXWD4tSjqKrL+
	IWu2rg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2rb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:40:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so6797160eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247201; x=1791852001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPry6s0/eZtpQh6W3xcXutov9SeCo8ZKZHlB3Z0ToE0=;
        b=D1cpFNFpKzQ3wmxbaAAE0UEtLlxxyWmNqcW+Bh4tXdALiOgomnovF53T///wHGTP5w
         5JkQqCmn9PYl5+Qbt3/1OYoTMNMrI0g1aSnsqZG/psTHMbhAcMXi3Fz4hHKntfyvaTro
         v/FUf/BE7bt1avnxX/LlBJOQ7rqI1J8FuiVZ3WqwXvbk61HuPwWCp30KRHNRasQ+/sOz
         k9lvXj/4uviEQsKtg3lqpQgp9RVrXcfGrfcQUOVJtu/+RnyYx4mAIBMnWIbGpD/WsbDH
         soKrqQiTYeb2ob4pUnyndtumKoJy9PjL+gq1MLeKQPjjSFBVQate0bjJmGp3WBhQK3IX
         q1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247201; x=1791852001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPry6s0/eZtpQh6W3xcXutov9SeCo8ZKZHlB3Z0ToE0=;
        b=e+Dvs110fE3qH9nnil1WShvnQL0bUCyfdjMAZM0RlCqbabr48ovXbwRgKZCZ/K9S/E
         hWsBN2mD9+gPAXPjGCYCkoeF3QjbzsUdwkaSctZgRPR+OAxgvP6KeUTKOI0HX9REmJ89
         WCyyFVF18IeuSDbywl3HKvf1+pyg005+9wNAJvhCENxh3P0/EUpolOSahOjl1qaZ0X7P
         fneDvJuCeqIghGd6GCqTc2rtfJKBg9om9sAeUFMYtVyHbCM/rM1xJ2ndGCNam4nWMWV4
         /zoZgSpi8tWXW3MZ8QJgywDd45BWYBUnq1AI2wsgYkJZqYV9cH1ZejeAY8h4s1rq7QX6
         OsUA==
X-Forwarded-Encrypted: i=1; AKwUvBwdEjyjipKJ86x3+3Id6LjNKVB/T7XlSXEJ/RxSx/i3z/nTEPtAaWWeLmnR7fckF8IkqlsIM+4cDUJHhWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRxtmdo7IJIJSvZkQskLzkYCJXOgThZ35e6nmy/YVFxIt8YlM8
	Ic3pci5YUczT8MRVwqjc5z+3kPn6sRA8vkD6mMERNV61LemssSuqA5u84ePcas1qZUZo7ej08+c
	hfGPq1hihZnk9YltC4lpsX9s04j4RtsQgsLJf6tnYGs+KjtHjDruBHbkbgc28wT3z+g==
X-Gm-Gg: AYBFou3KGPVf+XRnfU+6IlGns7vjT/nvGBzLX5dZzI4AYNG9UnIyp4xr6EvdrYijNDF
	eNSe1hNUjZgARPKpJOQHuz9TFYPcvvaaQ4zvDeDouLm6Fh1mbpU4G/QtAr5LRUPT2IMGWMq4XhU
	K9gk+jjdqGxuMzgIdnzOg1/qVt7TduyO16VeoZzWrj7XSUUihKCCvrdkTHDmS8ZZ0IL3Ajw9gG1
	o60bMGopx0W0AreNnJpkj34EWsYl4pdmaENtMc7eJ9sexGM6lHn3csCsHLCkXqfkleO07DRaiZG
	CNpFWR46btCUDmQ5QygBW149nzaszl2QH2dpiTz53gQOLuN4fGIc+KS9EnE9udrBf3i4XgOSzFK
	k9LG9X2LvOt17ebd2QLhNtYqAeMGwo34ijOH6I3OW5fLXbvSMHnGR1tHEng==
X-Received: by 2002:a05:693c:3881:b0:34c:bc38:e2ee with SMTP id 5a478bee46e88-34f15066431mr15179407eec.8.1791247200677;
        Mon, 05 Oct 2026 17:40:00 -0700 (PDT)
X-Received: by 2002:a05:693c:3881:b0:34c:bc38:e2ee with SMTP id 5a478bee46e88-34f15066431mr15179369eec.8.1791247199931;
        Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:50 -0700
Subject: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: 9XZcqklKDALByxgo_iNO6fbmNFghrdKh
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac44362 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aLZfyF7oQ8oiUT2OKIMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXyKAtobItYXnE
 H+B89DQvsNNQ9nvshSFJeMOeuyALx7JRwPF3FxaUlpiREHI42u16P8wpctj1E6PyvZrY2njvalm
 iCu6rMElcP9R1uMgWorhukdSFLcb+IA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX2Gevq/7VtOJK
 D4RiqH3LViRdiB86jJpWJEs9YVoYMYY+dN0HQR4vA/gv1CTbBsZQyXMxFv8U3aCl2F+K2ytJNBn
 83wk+UhuhZIheCDpAy0/Hv9xzYgYbtqytRa3e2v3BgYHIVFiEHb7g/zvyF0Bkb6ro6Z0+9mxIVw
 cR8z/FTHlwZoN/ZTYgnjPHOhO9JXp9iT8tRLzUkeKs2cdswofBgeqn71WWVsR3osY20c8ByOtvM
 UQda6yGI9fTWVEGA9PZy6fcJIPoA9AmDfD7DrXyHwOwbUSwEy7A4eCanGu9RLKP0azjYbRzMVLl
 f9HB3YrWQFS4VyzhmVSEA0uD4vTjuUmLyBK5iIHoW9hDYVcygyZhzvTR6HMJunAaKxlZjMS3c87
 itRTWGQonwlecNaXkNl8KcM25EapI1pzjEUtcnY4M8Gj74OOetazmri2QLoOCpr3aDrWIW1/y5O
 aSICDjX7fYhAz/0g1pw==
X-Proofpoint-GUID: 9XZcqklKDALByxgo_iNO6fbmNFghrdKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001

OP-TEE commands can span multiple exchanges with normal world. A call
may yield to request an RPC service or allow interrupt processing
before continuing execution in secure world.

Add the RPMI yielding-call path used by the common OP-TEE session
operations. Submit the command and RPC argument buffers as ranges
within a shared memory parcel.

Handle RPC requests while the call is suspended and resume execution
using the token returned by OP-TEE until the command completes.

Use the common OP-TEE call queue to wait when an initial request is
rejected with RPMI_ERR_BUSY, allowing another active call to complete
before retrying.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 124 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 58d82678be98..6e76316794c1 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -9,6 +9,7 @@
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/overflow.h>
 #include <linux/rpmi_tee.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 #include "optee_private.h"
@@ -560,3 +561,126 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
 		optee_rpc_cmd(ctx, optee, arg);
 	}
 }
+
+/* Handle RPC command or interrupt returns from a yielding call. */
+static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee *optee,
+				  u32 result, struct optee_msg_arg *arg)
+{
+	switch (result) {
+	case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
+		optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
+		break;
+	case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
+		break;
+	default:
+		pr_warn("Unknown RPC func 0x%x\n", result);
+		break;
+	}
+}
+
+/**
+ * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
+ * @ctx: calling context
+ * @req: initial command request
+ * @rpc_arg: shared RPC argument buffer
+ * @system_thread: caller requests TEE system thread support
+ *
+ * Only RPMI_ERR_BUSY rejection of the initial command permits retry.
+ *
+ * Return: zero on completion, or a negative error.
+ */
+static int optee_rpmi_yielding_call(struct tee_context *ctx,
+				    const struct optee_rpmi_call_req *req,
+				    struct optee_msg_arg *rpc_arg,
+				    bool system_thread)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct optee_rpmi_resume_req resume = {
+		.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
+		/* resume_token is nonzero after OP-TEE suspends the call. */
+		.resume_token = 0,
+	};
+	struct optee_rpmi_call_resp resp;
+	struct optee_call_waiter waiter;
+	u32 result;
+	s32 status;
+	int ret;
+
+	optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
+	while (true) {
+		if (resume.resume_token)
+			ret = optee_rpmi_call_with_status(optee, &resume,
+							  sizeof(resume), &resp,
+							  sizeof(resp), &status);
+		else
+			ret = optee_rpmi_call_with_status(optee, req, sizeof(*req),
+							  &resp, sizeof(resp),
+							  &status);
+		if (ret)
+			goto done;
+
+		switch (status) {
+		case RPMI_SUCCESS:
+			break;
+		case RPMI_ERR_BUSY:
+			if (!resume.resume_token) {
+				optee_cq_wait_for_completion(&optee->call_queue,
+							     &waiter);
+				continue;
+			}
+
+			fallthrough;
+		default:
+			ret = rpmi_to_linux_error(status);
+			goto done;
+		}
+
+		result = get_unaligned_le32(&resp.result);
+		if (result == OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
+			goto done;
+
+		cond_resched();
+		optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
+
+		resume.resume_token = resp.resume_token;
+	}
+done:
+	optee_cq_wait_final(&optee->call_queue, &waiter);
+
+	return ret;
+}
+
+/* The caller supplies SHM with room for command and RPC args. */
+static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
+				       struct tee_shm *shm, u_int offs,
+				       bool system_thread)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct optee_msg_arg *arg, *rpc_arg;
+	struct optee_rpmi_call_req req;
+	size_t arg_size, rpc_size, rpc_offset;
+	u32 parcel_id, nonce;
+
+	arg = tee_shm_get_va(shm, offs);
+	if (IS_ERR(arg))
+		return PTR_ERR(arg);
+
+	arg_size = OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
+	rpc_size = OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
+	rpc_offset = offs + arg_size;
+	rpc_arg = tee_shm_get_va(shm, rpc_offset);
+	if (IS_ERR(rpc_arg))
+		return PTR_ERR(rpc_arg);
+
+	optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
+
+	req.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG);
+	req.parcel_id = cpu_to_le32(parcel_id);
+	req.nonce = cpu_to_le32(nonce);
+	req.arg_offset = cpu_to_le64((u64)shm->offset + offs);
+	req.rpc_offset = cpu_to_le64((u64)shm->offset + rpc_offset);
+	req.arg_size = cpu_to_le32(arg_size);
+	req.rpc_size = cpu_to_le32(rpc_size);
+
+	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
+}

-- 
2.34.1

