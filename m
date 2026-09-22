Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4F4A2058
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101798; cv=none; b=goF6Np/sVfUIO+faS9Mbc5rtae8u25hWOCcrhFsipVgh6Zws3noOmLfssYTlcxmyw90mitPTHYH1pg+PAESMvfxnmp38RRuLkzxpA5nAqs61ToUsaRzyWLJ5YYrvJ+NdgIbvanrRQ1f3cGhBEXkFkHkL3lDJkSM/i8axm9yP8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101798; c=relaxed/simple;
	bh=3K22nMmBrcqnqEzSD4xLhBgYMhvQOFPIfgbgWGPsiGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFN5jZatNaoiE18D/HxFx9IFmIj/gfHX5H64In6G34PFqYaILCdARrZKPv3GuQNhN8HPNt6qovLfxbZwPteKGyr1dAxquLppzbtF6i/xAGX0VKda3q2lqBYic4SIfQPTSTDgOrj42bV0CHW8Dn9VpZdwrp9iy5Eu9d/Xd2HnJ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmdLgGU4; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmdLgGU4"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-14380910258so61511c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101796; x=1790706596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5r0+TxY1DluksgtxsosJLu55AsPexRg5kdj65bL0v4=;
        b=KmdLgGU4LuuQBo9nOE/BndG0wbv7vMcuF38tu34D3J88r0pFe+e0AzL/gZxe6JJ1RF
         Nl80tF/NtmaxjlQbrhVdPVS22ULkShaF09ia6E7cxmpjLXhLe+e0jBp9p1i+hgn9n8ML
         0NEQzTYpoZdmeRWyQxuAhL+VcpwB8DkHjEl42ivogTDDJ/annTa+3AdMgzNBa+omTeUY
         SRo5PvFkWh386pGRartNtpCmLt1cYEzEzLPqTW6dUJaEHNB1FAhA/BbWYQnV5iaWSdfE
         Xxrr7mj9DxpHSg9sp8p+/qEZ5OvaeA3tvihYmAdLRKC1B+QNU/K1AZw5Zf/gfD1bEkkM
         b08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101796; x=1790706596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5r0+TxY1DluksgtxsosJLu55AsPexRg5kdj65bL0v4=;
        b=2EN2OJLM8efvRJHAXAGQN6zL0CZoYiLlk+tMB/Baq+FFxL3m/ASae6Z7kiMOJi/6sf
         i5XHZUkCrjczzuGVCQyHQgcx/Wz6Txd/HP7PAZm+Nd1RgpDYbMlYCeOgj6m/HoM88Ie7
         ZH4zlcpyMaUgZyYnTcBqLlAPjjGtkR7z9U3BDc0hy3wSZx89RBxqhVr4wYlZLF2cf9v0
         pKW/4XoESfssdRHBPQ5GkgAmdcX+2tq0z+d3U5ze+/Ts/ynacRqRnmiCL+EkSoMaTFLE
         T80wVZB5UfXuYLXVompFpL21fck9bx3IfVOCYGfC0UlGSAAAuKWfGwb0VL7jmAAHr5Vh
         s4og==
X-Forwarded-Encrypted: i=1; AKwUvBxG3ZWmXFwwVSVf626tSVrA3DUzOGBj7k+iIBpZAjKxmClvROV/ZsrUz3ODc/N3m85za81TIbEZIilcgys=@vger.kernel.org
X-Gm-Message-State: AFuF++ltj6tDM27q5MMHvF9+4ZEGl2RVRsSBZ9OAPQUWWVBL3ZxDcTCC
	2zcom9Ep82ExnMZ80dlIoU0TJx4Vw9+EO3A7GRrEx0TazkP9+kTt3lv4
X-Gm-Gg: AYBFou3ENK4Y/BF+SHHfnvnUWkLy7B73r0sY8ZXH5uazqZX3Zbyau4c/kJ6PFStuoy/
	NFeeRB5WuASBgnhmXe45Ui4Zy94Vxyxj/A3KMKclwA/FZlJUXRra/XcpAJ3xAAkOq+w4V/VwAvB
	MpfLXTWGN4S9O6JzKuT0s6qUiAUc72Qb5nnY2XmbT5VLXdMq1NP/hyXgoOpORc7ji83piDZc/wc
	S9gan7k5EezkolPZMEKF9s3tQ6WkZokveJtK0APzmLUMZpFlmKqMlHcX0PRbw0rkbf4FXZlOg8I
	oV9RUC9eapEEei4CHDiKXvsi0ugOnMR59M8vcXii/FQP7SnkPMyfcy4lZT+WakQIN90B/yHvbIz
	NU+f4uAXN2qcFmhHdyr5/9+4yGVDF+mEmRO8LIchLMtNSlgObKAn3VykneDhwbz/7e0cqkWv1cz
	aeF+3cKJEiKXis13G7MH/Ipv4Zu/gvEZTgl5UjfIyvY5XkonHLYz71njlGl1MM0p/U6+jKHoqNw
	x3QbOxfpXmVZhL/iaVyxJSh9fzXZ3YrqfPvfeGRPUmwtmt0cAMyFGyU56ElnMM7r7FOBUU=
X-Received: by 2002:a05:7300:7913:b0:33e:4ad0:4bc0 with SMTP id 5a478bee46e88-33e8c53ad63mr144501eec.9.1790101796171;
        Tue, 22 Sep 2026 11:29:56 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm154315eec.3.2026.09.22.11.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:55 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v5 8/9] KVM: PPC: selftests: Skip idle-page check when running nested on pseries LPAR
Date: Tue, 22 Sep 2026 23:58:52 +0530
Message-Id: <fd4a29b096f5ffa23198cfea469a0ea0f535bf13.1790101179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790101179.git.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same nested TLB/access bit issue like x86. Use the is_pseries_lpar()
check to detect when running nested kvm on pseries LPAR to only warn on
idle-page check.

Reported-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 .../testing/selftests/kvm/access_tracking_perf_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/tools/testing/selftests/kvm/access_tracking_perf_test.c
index 4415c94b2866..94bfb82f7b79 100644
--- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
+++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
@@ -470,6 +470,17 @@ static int access_tracking_unreliable(void)
 		puts("Skipping idle page count sanity check, because the test is run nested");
 		return 1;
 	}
+#endif
+#ifdef __powerpc64__
+	/*
+	 * Nested KVM (pSeries LPAR) can hide accessed/idle, since KVM doesn't
+	 * explicitely flush the TLB for access bit update. L0 keeps
+	 * translations cached so the guest won't see the idle bit cleared.
+	 */
+	if (is_pseries_lpar()) {
+		puts("Skipping idle page count sanity check, because the test is run nested");
+		return 1;
+	}
 #endif
 	/*
 	 * When NUMA balancing is enabled, guest memory will be unmapped to get
-- 
2.39.5

