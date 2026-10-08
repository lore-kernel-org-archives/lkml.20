Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637A24A5C3E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468170; cv=none; b=RqnVnilOwykl/5+pFIZbTUPkNNPxcPiFzbyUGQkZxqbyG7R35o1Q0lquP8Gmji90p8WsNvZB0DkfKTAYnaTvqpKshVQfEkPV2e5fweQ+Zs5+ozZaubCmSTmc85GF4zNaIVtZ2lncik8yE+h3xRNZrb3BhshEml9fWo+p/vf3zlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468170; c=relaxed/simple;
	bh=bahwq3zhX8Ly6A29Jjh8zxDv/0A1k+kF3/Q6NsvVg3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UwGiuErcbdSO2S+Ozwq9usICsPJPrfYwpouJBPqAr3io0jr9ZiFhJeeVwsBBBvfRgrtwcBD69kKWcapNglV/AaeUroIdpzU446dNLUCQfNgRplGpuZmU8J6iHKwX/KEZC1OVatMeJWTrKoa2vsBk7KpZe8dotxPfpuZ/m6uWb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOEJ2qos; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOEJ2qos"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1419d3416ceso9996361c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468166; x=1792072966; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xtcAtg9RPe8ybW5E9qQpidKnLoLoxeabdblRAW5zS/w=;
        b=sOEJ2qosSo5uonVOT5O89+SV7jQ1cyqo33WIeCa3OkAdP8zOtbaU/VyCJ6nK+rJxbC
         zAwNehqDbtal0UpjfMUZSD9XnEu3KGxfkgQPCeVSDbGOXhzapopydSiklVPfoB7JGy12
         bvyr10bWET6bsOU1jiluE+PCyzYKzwf5JiORrQNqOo4ovrMc306NkFynVnJ08ztkGEr0
         LgAF4q4q6cqXBXJvmJkTeoA9cTb2Dry9pcFOPEql78fqWfAsf3XFfdZ9PR7SkYOHnx63
         s8CTgPEkGN6/d2yiECLTHUFkFWFNC+N/+D4Q1bE8ucLhBf/cJ9xATZ4N2AQZopcInm5L
         aY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468166; x=1792072966;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xtcAtg9RPe8ybW5E9qQpidKnLoLoxeabdblRAW5zS/w=;
        b=tH3cvyOufuKf2RUrJl9V1XJPDHbgrak/GHeJFgyjDcoIVLvIYJwq5crfk3yynK9k6i
         jl+Kgp/kg9enZbFMqf1JyTi1yM5sk+Wvyiw/2rLUB1sE64BiYKghJQPDlB7zkM9kRtr2
         y3pHpjCSAvIw2j2jHPkqOZJslnypY66BcOnfs7RwGHDqZLQOMVkvati9FI6qJkwgynQ6
         KmPmuWEhMkU3gnN4bc/H29pFYUq0kMRgH6TYOnHP6FW1/f+2tywg5D9Xf5O8p+IGv9cD
         PpYHDKdx9O4mGxglTAYGLv+uN9jBziCzClWVoa7XqW6JAkL4gK3q2y6MGmUWIBlENqfl
         oirg==
X-Forwarded-Encrypted: i=1; AKwUvBzbJlIIhd1/IM/hP//AEPNo7AWrWpovYD/LrcuIQ95N8lprM/6s27y44T3HUiji/q+Llte21pqkNErWVUU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfnItiRRIjMs9O6C8yA6cX4Y/z3Atwoq5unIdTomh3h7WmWN7K
	UNTYveOT5ePMEtoWBs8v2Oth1V6MtUWPTzQOsmISztVH8uqj1W1z/Eug
X-Gm-Gg: AYBFou3RcEytHmeThf8i9qGiL2v6IEE6U0iAlgO5LLx211dRx8x9V7iWf++1Bi12rbA
	UNaWiXrbF88B7PkhMRbu3uYly3tKFFfZ9me3xm7yLzDveD344Vq+zTbMBcJiRC0d8y46ZpcsZnC
	2J/eVEIQZqZf+G5ly0cxodjMncCpfzN0/sk6SNN8sbpiGixMb/bn7Znm5NPGwitbuTbcqRRKmeB
	E2frmxficuAM2wm38xprVzT+m3D7emS7D/v6kSi/zz6BpgMxF0RfidY7jpeOdZDz6i7dugEELrv
	ILzklvR7j7lh9fZtRXcbgot2NkrCHTOqh7hJvp5EYpS6+QnBGPf4fgz77nojgfn95Dv4zNeb4sa
	eOXZyKk/OdZOpa9g4DDHcNp+ItR9Ko9Xr9N+7YRaaLIFxMRUEeFMDb/u6nXM+45LiBMgj3v8Ih5
	VezU09YiSufpm89ib/HQBGNcHgmPd0fGLQm3svml11jQOHEBNI5dsPug3bfH4D+7e75jJgug6RP
	vL1
X-Received: by 2002:a05:701b:42c2:10b0:143:297c:276c with SMTP id a92af1059eb24-1620665f4f8mr7308989c88.33.1791468165887;
        Thu, 08 Oct 2026 07:02:45 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16375a1f898sm11460637c88.0.2026.10.08.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:02:44 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:02:39 +0800
Subject: [PATCH bpf-next] selftests/bpf: Use its own netns in
 flow_dissector_skb_less_direct_attach
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-flow-dissector-netns-v1-1-5d9889aaad84@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH6ix2oC/x2NzQrCMBAGX6Xs2YWk9Q9fRTxo+q0ulKRkFy2Uv
 rvR4xxmZiVDVRhdupUq3mpacoO46yi97vkJ1rEx9aE/xhDObJjEYW78mIVlKh8e1QzJS+UMz8Z
 p2J+SDBEHidRCc4Xo8p9c6WdlLE63bfsCqJKqc34AAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

test_flow_dissector_skb_less_direct_attach() and
test_flow_dissector_skb_less_indirect_attach() each create a netns to run
in, and test_progs may run the two at the same time.

Both name their netns flow_dissector_skb_less_indirect_attach_ns. When
the two tests overlap, one of them fails to create or open the netns, or
loses it to the cleanup of the other one.

Name the netns of the direct attach test after that test.

Fixes: 2b044dd186f0 ("selftests/bpf: re-split main function into dedicated tests")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/flow_dissector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
index fb48926814647..f6fefb14cda3c 100644
--- a/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
+++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector.c
@@ -706,7 +706,7 @@ void test_flow_dissector_skb_less_direct_attach(void)
 	struct bpf_flow *skel;
 	struct netns_obj *ns;
 
-	ns = netns_new("flow_dissector_skb_less_indirect_attach_ns", true);
+	ns = netns_new("flow_dissector_skb_less_direct_attach_ns", true);
 	if (!ASSERT_OK_PTR(ns, "create and open netns"))
 		return;
 

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-flow-dissector-netns-c347cf31e5f1

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

