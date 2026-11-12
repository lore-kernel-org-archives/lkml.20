Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504937;
	b=n37W1nqN7wvV2DIt/TPinSmFRrKhDfo4ecQFRgYOSmTdBeigplXAC9u1JEm6uFlK5K2F
	 0Bn1FdFCS4CLB0XZeptC2pK6N0UStQtyEM0XhuyrlRIcZxsWqcY7znCa3gIKqN3iD8/M5
	 xvEgAGSE+ZbXEuHs9O9m8K4rYQA3hMeVnmzYYuko5nk7NRxaZJ/6ajYe6jNhnKcX4q2ug
	 3J3i6mlwLWZ1OlAL0nlkoT1YksJ3aBAAND4JPNX8M74XtiiPaEP1wKewOVV3cM7Yq/c0i
	 zQEeITbx90ho6BajTYzCPHePh8p30TVxnwtPNUQDJoY3iivLaU5a/bKkZVpCIjXvyOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XkIbYXadeaMG9HKV2rC3JRZDLd4J3RXCWFCJdXi08X0=;
	b=IkpcafbI7hb76SAD3tQr+fNdPeer2pitj7+1vtcjJWnuH4VmUcKGFzuKSY39jArLXC3P
	 M6NTWjjuK2FfRdAs8VP31dJKZBB6mAmNqyZF229op8KmQmCNyHL2seR2mI0rP+p8jIGs1
	 OAwaWhkwq/S6k5f7Y3zJXHGiwXtk7Y+D5a1PJlnRsMsgzPycMY+kwnensGE9tbp5ov1g8
	 s3iCw9z9zP//JMsxpJhi3d+XKclxYdKo5w+wO43ljLfFsiNZsb6Yj0gPlhOrzE5baYIBJ
	 GEIqPy1ZYp1QeN4inw63k19dRxLCk2kunK6xnNalDx6eU84NaF5Xx3w7aaIY5iAjy+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIMP2nB3;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AD7606A8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AD7606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIMP2nB3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3074604f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504936; x=1795109736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkIbYXadeaMG9HKV2rC3JRZDLd4J3RXCWFCJdXi08X0=;
        b=LIMP2nB3cPMUdhws5RaIXR4tga9oAlQTraWtWrHTJKOqs5l0cXKzgKLK7GCwR58MIR
         V0+47hH9R5MrphjjrCXy5PNmubHhEyJwWQyX+OAPcp1UrfnxUJP/zwQSU0PcsmJcKeJO
         ZEVVgeEfZy+Kj3YWrlSmySRLjJGWy85AIg5gQU5hbH6iUea8dXk2Z6XoyI4PSe5UhkoX
         WXtiL25Qpd1k7lOn6PIPnJfJhks4HD+3lSMpGNr3lKjeXEiI9niaqqzJnyLdud7j9e7C
         pc2g/aov7gImzhFjDKgQSkGKy24pzW7kE+CPEL09oDrlTkH3Br51aO3wyoV9OUOHqXAw
         XE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504936; x=1795109736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkIbYXadeaMG9HKV2rC3JRZDLd4J3RXCWFCJdXi08X0=;
        b=B7lGZ/6jc9IikBdsDsiuL9qK7E/O4TUNYFFDM/d9qz061k0Utv3csCHmsDyAJpe8nL
         MUg73DtPa7p1gX4bBo8OZjH4XgJCuYF62BdCf5ca8swTh7XvcGvL79Upnde93xphzvDb
         v2/7JH4aO1mxtvx48rfYzGQSrNIqbmcWy86wEVvD2oxsKYgo6IscFv4DM+ROG306mWRt
         3Bn5mUcF13+WtcYEa+ZH4JtBY+pq41ggHWDwlg+dux/VanRm465FYbQwvcmQbr3ESwA4
         VC6Y60gxS+Gncn95BVhjUKZph4sB4DWV+hgqu4jAvSjf+m5pPoAjV1WozfwLN6jUyeW8
         urIQ==
X-Forwarded-Encrypted: i=1; AL+hErHHlQP8gBCurFM8aP0zM9gXpxKTxFheIqB+a5RIhgeBbohHezRlPwCcxo5hHaVfjJ0snoDM44CIhRS71Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ie16ueap3F0HrCMSXq5b3YdGJcOIgghypQT+SoIEoBixE9p0
	H5SONi/AcJ8v6xGcbra17JLKMxQ3XjYhHttwgpZTTmVvKv3pr4KrP6KE
X-Gm-Gg: AYBFou1Uj0FR8am9QpE/aNZQnawYEJzTpub7iMi07+YpOQCU59a1FJDgmArhgjxAGek
	5kzUWQwmr3Vv2gNQOFyV7ukhyWD5Lqk2GOKrprCTG7Ca2qeFgTBMnkbUi/QNq+w+kyZGWpOsp9v
	+k/Kbu2wa4UzfqtBDp4ssmy8PjQg06vikbMEJQcumXKqNv6bSMgN1vrv13aiyqF6UEaHgYwJDD4
	gqZpq5+ilHF47geBUqy7EnlFQyn82gAvmjY7xuP+Hz6upifouLGbUVFrj9GYz/mp9AaQlWd210a
	JVQUPbSVvRkm84DqFQL6RUlZ5RGM3B60Q57PLjp/34gbtwCiybzssf/rG04eA3TzIUx3twhZT0i
	9d3QjQz5ZigoLfNN+AvJQuTLAOXSBkARKdoEjyWxdpnq7JsHxBC9Fgms1O5gkktokiuV3Nv1ASd
	sUez2S2y6wR+5fj3E09J7dzpsLmxoVuAqNN+j4SvrkbpTI6Gqv7oZ6MnURcoRbgueuHCvL5UGgA
	IU1JAzTToMNrJONw08VSAu/JOOnW6Xc6W0lgEEGgW9EAegunuM+1ei0EVxxKb+GzMhdI+1rwhF1
	BkWkqV85xherE2kcfoLp5wef30N0gr0Lbdfo7wUghF0yZOfH/oqi4UYH
X-Received: by 2002:a05:6000:4693:b0:490:c68e:5d5d with SMTP id ffacd0b85a97d-49c74864785mr53180f8f.49.1794504935838;
        Thu, 12 Nov 2026 09:35:35 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm401037f8f.23.2026.11.12.09.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:35:35 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: yzddMr6 <yzddmr6@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
Date: Thu, 12 Nov 2026 19:35:23 +0200
Message-ID: <20261112173523.1474-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
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

On Wed, Nov 11, 2026 at 03:21:13PM +0800, yzddMr6 wrote:
> With this table, system suspend can reset the SoC once nothing votes
> for the LPASS core. On a Xiaomi Pad 8 Pro with the LPASS_HW_MACRO_VOTE
> and LPASS_HW_DCODEC_VOTE votes released, 16 suspend attempts (15 with
> s2idle, one with PSCI system suspend) ended in a reset. The PMIC PON log
> shows only PS_HOLD-triggered resets and no PMIC fault.

I tried the patch on another SM8750 tablet, the OnePlus Pad 3, which has
what looks like the same symptom: the SoC resets about a minute after
s2idle entry, and the PMIC PON log shows a PS_HOLD warm reset followed
by a PS_HOLD hard reset.

It does not cure the reset here. The tree is v7.3-rc5 with out-of-tree
board support, without Ajay's series. Each run is one 60 s s2idle on
battery with the USB cable disconnected:

  this patch, Wi-Fi WoWLAN enabled                    reset
  this patch, Wi-Fi WoWLAN disabled                   reset
  this patch, rpmhpd domains left at their highest
    corner (rpmhpd sync_state callback removed)       reset
  no patch, MC0 kept voted in the sleep set           resumes

The last line is a local workaround in the interconnect driver that
keeps a minimal MC0 vote in the sleep bucket. It is the only thing that
avoids the reset on this tablet so far, and with it cxsd, aosd and ddr
in qcom_stats stay at 0. The first three runs are without it.

> Holding LPASS_HW_MACRO_VOTE or LPASS_HW_LPR_VOTE across suspend let one
> s2idle cycle each resume, but cxsd did not increase in either case.

On this tree the two votes do not seem to be dropped: with all five
macro codecs runtime suspended, clk_summary still shows LPASS_HW_MACRO
and LPASS_HW_DCODEC with a prepare count of 6 (LPASS_HW_LPR_VOTE is 0).
I read that on the workaround kernel while awake, not during suspend,
and the codecs have no system sleep callbacks here. So the resets above
most likely happened with both votes held, which is the state your
tablet resumes in.

> All of these suspend tests were done with a USB cable connected.

Does your tablet also resume with the cable disconnected? And does your
tree leave anything voted on MC0 in the sleep set?

I can run other variants here if that is useful.

Thanks,
Vladyslav
