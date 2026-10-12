Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095649A3C3;
	Mon, 12 Oct 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819425; cv=none; b=n3dQx3BX3RW01nNE2bJt24TozUp1naJHhimP72tAduAUibqu++a6lOXKgrb9Z6yVFjsX7TJCadai6m0PhiO+uKbk/pZyqEQa7Q8k4BnuuSQT40bJ5fdlFxoWm/tbil90nsOJbkb8r9w/GQftMefg+0dcsIBkxLM9h+Pt3ZyH+Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819425; c=relaxed/simple;
	bh=SK2DVvAzHU5mUCQNOGITw4FGpwWwo9ubZCUOAKQcxZ4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=np+Uexm4M2rirLgkqbUtWLOoW2Dug3l0kBg5h8hJ1TxAPSLyRjytecBL2plC2oiK/+8wQcJeIO77/5awNulNZ0yie62P+poTcMqk8wCCcEsplN+YDZYDzHVv53aFYd46Pq4opYZ5w37/Hj2CkI4e4HvoTIiPwEFVFwE2LyeF4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Bq4Buc5L; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Bq4Buc5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791819420; bh=HRj7G6CKKKdP5UyKc6PEpkED/6COnZ+qFvROUHtj9G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bq4Buc5LvfoopKnA1WEfSqx7LdgqLL64bTSp2dTyEvujGkDeCx3Pj5PHDKRj7sIix
	 HKeH+xyovK/wB4Rj6sWMc33PzT8Tb5NKUsuGNOKCPE9VBXVk+XdKKobK8dYWRqUik2
	 9tObKaNpBNjHr7wbgA38WjsvYW5J69le5vgtjpyY=
Received: from DiagonAlley.floo.lan ([120.253.195.162])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 93732427; Mon, 12 Oct 2026 23:36:55 +0800
X-QQ-mid: xmsmtpt1791819416tanqdsiw0
Message-ID: <tencent_E823072BF5C3CEE0CA3D57468F40DF200805@qq.com>
X-QQ-XMAILINFO: OD9Dg+xNgbHxxGU3G2DBIaL1+HvRhk6owCKzIdYlCyXeURzjw/InYN5JOMpdt5
	 bT6qikJBLvpjEkT96n3hVAF1aEMB5IDlzZUAayq0i+wclLzJ4zDfdWqxelhij8fX8F2lxKxtcDM1
	 IVrwKVWrtFv9q2seZl5xZ/xcKhn69f+FASdFJLRT3gbGtGkIqfCuHJJx+PCqk0/+cMu3yCYkisGo
	 38Q3tpXWOX+fSZ50QBeoLkW3vF/9G5FHjdkSi4WGlUywceH2dC8WsB52kNe3MXpsyudMF2y6BcYS
	 Z4iddztpdxJfnCx/HAdIRzq7rJ0lgZ/QsZkcNERVcMYb4Iqt0lKv2ebQ4cZ2bi91PibYrQFefuyh
	 ORVvdlJCp6L/vdn4cZrt/gY5gUYZXA9qcISTVcTEVYXBH6XIDO7YRsY7tPwaNRJTXvDd24pwC5Qv
	 BhvPSPP6eliKNMei1cqtToXhD1OnnOYWvNDpZCOCTbR3Gm4SrEWof+TWc3c0BILGD3LMB5LCWfFh
	 IZtBGFylPXzGMThHSsKI10zK2dzqX/Ww+Gbj0h4H4YmLRZSOLwuJrKCfuQSWy41igA/6DtNdOYW9
	 rbObtgypUCl1lDpCLZUxxE7y35sn/p6HJYbSWW2pTLn6GMziJIzdiVzS/Exjzm2dTssa0eGYpmq4
	 sBfERT7kUjcDNy2GA9WlvSAe6WmBorBbGh/haUJ/2zd4nMMdv4ncr3w7dpdwfzxcafuxTtctSLhb
	 VXmhEIJwW7KVRRFMFog07qoKBE6rZCqXqT/qCkB/n2AkCXuHVC1VQwMWO7S1KRVk1p+mwTSmkkw6
	 MdMmGXk/iMRvocsci1g9GuF7vj1IZn9UfzLxw1OjnO7zBEoF4+FYfn26axlymgFB86i6m4svtntm
	 BdPx7SFhExJe4a6LFxY933LciJ1oerH+fyDtOaAIOK2FvDMA6nTNPBDlvTpWPmbajjbqSNvkt222
	 JI+6jMqUZmE0QBt2XbPrnAOYsMrusajC1SfPSM9vkfCDPpPIyGqfKE0SmvjlPCUN4W5jeVQPEr7o
	 ZgqQQKr+QvqFECFAHoLXbFgEco7rcJHEDv/vKxPYQWSIhYFwSO4pdPa5NBH5m709bA9Gbj6vJbr4
	 d9OvOi1yH/Y+fgQM52Yc+nE7jZ0/b7V4lT4U0aTM0nxVd4K2VMwNEojAgIlE1lnX9oKhbGHPxZcl
	 pISRllKx/MN74/JV0dW3qIDGACOLZmnupChgC6VI+yvQgoDg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Mingxuan Guo <gmx472@qq.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingxuan Guo <gmx472@qq.com>
Subject: [PATCH 2/2] media: i2c: dw9768: add Giantec GT9764 VCM support
Date: Mon, 12 Oct 2026 23:36:50 +0800
X-OQ-MSGID: <20261012153650.1718231-2-gmx472@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012153650.1718231-1-gmx472@qq.com>
References: <20261012153650.1718231-1-gmx472@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GT9764 uses the same register model as the DW9768 and GT9769 this
driver already supports - one Giantec VCM application note (AN971) covers
GT9764/GT9767/GT9768/GT9769/GT9772/GT9778 - and dw9768_probe() carries no
per-compatible data, so listing the compatible is all that is needed for
the part to bind and be driven through V4L2_CID_FOCUS_ABSOLUTE.  The
GT9769 entry has been in this table since the original driver
(859891228e56) in the same form.

Tested on a Xiaomi Pad 6 Pro (SM8475): the part sits on the rear camera
module and answers at the family default address 0x0c (lens DAC reads 512,
as on the GT9769), and the lens moves with focus_absolute while the module
is streaming.

Signed-off-by: Mingxuan Guo <gmx472@qq.com>
---
 drivers/media/i2c/dw9768.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -529,6 +529,7 @@ static void dw9768_remove(struct i2c_client *client)
 
 static const struct of_device_id dw9768_of_table[] = {
 	{ .compatible = "dongwoon,dw9768" },
+	{ .compatible = "giantec,gt9764" },
 	{ .compatible = "giantec,gt9769" },
 	{}
 };

