Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906344;
	b=0a1ck+jkzxaMLQbWqvJ44gPOYCy2RDncwA+awvfMcO9ho+dfrqq+RsJ4mwwHCtxVbxJe
	 0uIiwtzF4JLjz/G1G7BRgd/zkMXsNb9BuRzjyQrfyqUskDfiIZs9TyWGqwaiam+FDl4zd
	 l9KdjfSx9+sZJwiEvA7vTf6TqCg2Dacvm1bfPOvAjVkPizHt/I9qWSyDmWTpGxn9Vep5z
	 2DmiCyMgPQaORJ9DHhyGS7qYkIullRARw0xaNoDXnqYk8eNIHN7FQABW0Yyy67KfW2QOM
	 4F7ZhD9H6bJZwVVWSzqGCnNYN9t9Daz2hTiZ0zarjGMAYr6Q4XRuYz7nW8EBDFx7HZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906344;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=lyHmLqn8ijLHBmt1owCnh5tVnYJUzqZCnxC11EY2PbU=;
	b=tBDcEagPaKB/lBC4+XTqw5X+Quha55dHMteGruPHEFichgCCazZ0qzkjUiN4BCeMUCwl
	 X9xqGCtrcco66T4EH0r5Cl7nWrZxilFp+0zvvwiYy//+/BaW9PqTKkswolMmtVaJ5BkXG
	 AY9LXkUsQxdIMEayygu3tcscK0S8QHS726fjq0JZjHisEfdESxuX/iUbxKMEhx0yVrTdN
	 l5lfJP4Lcb35xHvs/XH3Lr2uKe41rtn0VX2CGkLD+lWJ+ZDKyxFxtcYeZbge0DKpw+WAv
	 VuIYXv5/mflZaiDuHKEMKD87nm8T+FEX71IFbsK9jCl1HUn4PGzvHGFA/SAU4ABqOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=0KU0FlZJ;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=c7tt9CFi;
	arc=none smtp.remote-ip=23.251.234.50
Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7227606A331;
	Thu,  5 Nov 2026 19:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7227606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=0KU0FlZJ;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=c7tt9CFi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793906342;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=lyHmLqn8ijLHBmt1owCnh5tVnYJUzqZCnxC11EY2PbU=;
	b=0KU0FlZJdhZleU3v9l0Nh7UxyH76EpHxTPQdiLmC5lft0PH3DVOD+RojCyguA2kc
	AtmZLkTehPWi0sXCabWQuuYt/77gkZgnGJdxyL1UCT1jhu9VajlQLGK9kb9HwU1bWlD
	cQHZ0+cmWukLEA5L0C+fP1YnzUpBkjopYA3zMCD8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793906342;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=lyHmLqn8ijLHBmt1owCnh5tVnYJUzqZCnxC11EY2PbU=;
	b=c7tt9CFiZMKUQ62BR8HOC4s0ZYZIer2zhSXkewzar6/N13dEUHr0CP+XqaCzxefW
	Nos6hI6jfiypQH00P65WHxpcRYuoiJYP64FXzUsBm2W3UtkbIwK/Eo7BakJWeyAU0sE
	LWqaSXIDAk+y8c1PSoSI+MXe1xDETXkJF+QGrHlI=
In-Reply-To:
 <010601a0f11b66f4-60579998-13bc-4174-93cc-c5338145611e-000000@ap-northeast-1.amazonses.com>
References:
 <010601a0f11b66f4-60579998-13bc-4174-93cc-c5338145611e-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: microsoft-romulus13: enable
 touchscreen
Message-ID: <010601a1ad267a52-953da632-a358-4ded-a9bb-68d3031acb2c-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 5 Nov 2026 19:19:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.05-23.251.234.50

Hi Bjorn, Konrad,

Could you clarify the pickup status of this touchscreen enablement patch?
Patchwork marks v2 as Handled Elsewhere, but I could not find it in
Qualcomm for-next at f5672a3dff02 or mainline at 05441d697f7f.

The existing v2 applies unchanged to both trees and keeps the addition
in the Romulus13 board DTS. Touch and multitouch work on my 13.8-inch
machine with this configuration.

Is the patch already queued in another tree, or does it need further
review before pickup?

Best regards,
Jizhou Tong
