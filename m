Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260456;
	b=RCRZzxqg6dlm+bXHw0NQs4lyWydqRfDfwcJIS0//RZNabCZConTr9tE8kJMHTwV1GXBF
	 PaCxueGEAqPK6UFFKHh6uoeh7obC8oim9HDopytWVX/dUSIWnNkqcIKSVosujPVXRiyUC
	 avu9en02BH3EF8uJW6Fny/V1V4PUZP8Dn6a5GL+us3y4/AhpGDcm9ks7p+qHeJtbj7mNH
	 U9glvn1oCzfrIvnIPxVRiXle8o9cHriNqLamHmdUdv5PQMz//TNHUhcrARLjpAS5ZZMlg
	 E0qQXPgE3ZwecaJtbmOgsQaWg3r99ibEll6hFP7yzkobBliUxH/WZNLaTHYr0wMf7Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260456;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LUJG6W0I1xzh0G74P9mtxDG1PajG0W47AUf3Z48yEDM=;
	b=DDEgkk9URy5c5d/HmbPs0N6hY6qtWuXdqiR0AIjhfU6Jnn16TM/5O2Rc0RjFeoNNjvrb
	 vh3nxrIqTdvgHjgdJV83x6tPXYPFtQx5SueW9h16hZu1i/uKGEst6nhsejVK5O7s59jN3
	 nmYgcKb3AuM4uErVoOdZJ8rh0l1rxo32bbdxRU0dB0C5oPWelhieboddHOESZIUixAOXy
	 WWbJpJlZYuKJBnBC9dSnw7tQ5MxywJwlc96fFkEFrRInPRu1vwCflwi6PrNgkcItveGow
	 O+2fB4B8Mbp7c4oZCcZoFmRf0i+jdKA8AVRSUnF2eHjS/LYfRYsmaBpy5rl07isu1HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JBjATnG7;
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606D606A338;
	Thu, 29 Oct 2026 07:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4606D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JBjATnG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793260446; bh=LUJG6W0I1xzh0G74P9mtxDG1PajG0W47AUf3Z48yEDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JBjATnG7GSJU1nY1lGr3R+qFabkuhnTJQbfZ6HDV0TyI1+qH7zd4LiGPHJUjEZwLQ
	 etK5F2pWuY5l4dnDVDIuZShRRGjwB8BuOkoT8PtQ0biIlAh6bgnws82o9sx5she3TO
	 dhnYkSUjWn8mbF2DVAP2lqD8IplhlzO5cmdfaR4E=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id D83806E5; Thu, 29 Oct 2026 15:54:03 +0800
X-QQ-mid: xmsmtpt1793260443twdo29r82
Message-ID: <tencent_E9EEF3D2AF2C6DF28E4DC1B855625913D908@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+RwdaRveXY64mwAjpzX9uahC56Xqj6ngdp9u5ZJrA7j+/izsbJF
	 HweR20KZTm69AWnNnvnfYz9j56PWsJAGwwFD/b/tssFkWDpF2Thh4G/ZhsVswBardeCRkLuRkcV8
	 OOvX/kcWCvJLlH9obG77qEaV+Caz3ZmHgoiPMGeUgzUw4wmkCzlVuHb1kxLjmQChV1VKbbFPt76P
	 lHtrrNFVVaS1eH/tNQLFkrwBnkAr+IRS4WAP2f/HVccXJbYEBylUU8UiQXlFu/jvJyf9bpoBazlR
	 OiVNAmTZ2jjoL639NceClexMkNiRBiFGjEEb5EQRGkyhk0kI0AEI3PQQLEU1KFD6EppzrXu/Tp7m
	 JXN6dLfWd7vAETY3FqR8HPjfy7IN+BikHndSqNGl/MaDQXnM5CrtP88WpPFkMG1sxEhZk5AhnK+2
	 DEFkIovewjDiWIhKPSlt3lRnbSWc8WdR6xPRoa0DIySjUMw+akCV2TLRP/AdBCYuC/uM8wPOPi6M
	 djA778y8wCUV3rQ+Y/vv107uAChtlxKocc6EID7IRcTebXVj3mhnumIusMWkNG+OJ//eoZFIFFeH
	 5BXkVRnZ5l7PL9Mu/Xd+U+qJ8A8Acl42fyCwll6KgjiB/gdvob2beZ4f83eC2Wmijd92w9hrwBmT
	 Vr/kfPKtVmZjg0I1GtyUr/D+G/soBIs1DbrDS8BEd0vLmOqOt9M2szCiJbSPt3AW1CzfOdCCKoh3
	 vyKboTnD3UEGuvetVArAW1OVgIguYWAZcuM3UZKXvQGM47YIsABDHaOHHwJ6Yi2/FtkQDMEpDZ9d
	 BGQ6s1ZYvsdHCoSUkkZOYrSWzdkY4mfOIEG881Zj655vtOBzHAxtVBxUmwyW2FvlHd0nlOr4YisX
	 P9i4HbhpYhewa1WbuZL4nlA3kZTp8O5Bx+fQPBTufMEj8DkwMskQV1j1KeagRreGCE3sdM0eYGx+
	 0MEcTp6ckioLlJqdW3gFSiutmFtgM+zoPkkYOxnawXhnQSUqynhWBm2M6mGgfwvli3q4sTUlLUl+
	 uTNxYPYStzRBbXdnaIirDnxpjYdIkcwSFd+TYfvXBVjSnKCEjfmgB9BXtSPtrFwNhMpOm66/VIpS
	 RmvOmW
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shuai Liu <847807867@qq.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Shuai Liu <847807867@qq.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] media: camss: csid: add the 980 generation
Date: Thu, 29 Oct 2026 15:54:03 +0800
X-OQ-MSGID: <20261029075403.2907098-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028034105.326535-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn> <20261028034105.326535-5-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Qianhui,

The csid-980 register map and RDI configuration itself look sane to me
(the vc=0 stream programming matches what gen2/gen3 already do, and the
split RUP/AUP handling for the full variant is clearly commented).

> Only the register map, the RDI stream configuration and the
> buffer-done reporting are described here; frame start reporting is
> added on top of it by a separate change.

The commit message does not match the patch content, though.  As
posted, this patch touches six files, not three:

1. drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c is modified
   to flip the four SKEW_CAL data bytes (0x005c and per-lane copies)
   from 0x54 to 0x00.  That is a correction to patch 2/9 and belongs
   there - patch 2 should simply program the intended value, otherwise
   the series carries a value its own commit message calls wrong.

2. camss-vfe.c and camss-vfe.h carry groundwork for patches 5/9 and
   8/9, none of it described by this commit message:

   - the v4l2-event.h include and the hoisting of `line` plus the new
     `state` variable in vfe_buf_done() (needed by 5/9);
   - the new reg_update_after_csid_config flag in struct
     vfe_subdev_resources and the corresponding gating of the
     reg_update() call in vfe_enable_output_v2();
   - the CAMSS_8750 cases in vfe_src_pad_code() and
     vfe_bpl_align_rdi(), and the extern declaration of
     vfe_ops_gen4 (all needed by 8/9).

Please fold the csiphy fix into patch 2, the vfe_buf_done/event
groundwork into patch 5, and the gen4 enablement into patch 8 (or
describe the split here if you prefer to keep it), so that each patch
stands on its own.

Thanks,
Shuai Liu

(This review was prepared with the assistance of an AI coding tool;
all findings were verified against the patched source.)

