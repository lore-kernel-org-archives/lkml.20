Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6C47989F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879024; cv=none; b=UNJY7V4tuL+5rvMj7j5idT0iVh+7ObFdGfdOL5/+XWWEuWG7c3//gyOqcmHlG73hcSuVehTHRSGgGmcG8DjHHgFj97xj6+DIHBim8SByW1Hg41Ig0F+DbShZHF28U82FtItxP1QUKkapRWNqEX+HGIkDfQTxglSaYMCBLfXj1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879024; c=relaxed/simple;
	bh=w+Rj3G8MeWENpGpU9bkxb/49JnYbE2AI4ESVecBl5GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMeqEk7clSZaV80mmLSAibi/IoZiBgZidXtmPsGJcei2H2rCECnCzXRt/H2DgDKVP2paZz+ShXsT5lKH0LYs1w8I7NIP3TfLgn3pigVgghMO4KMqMixJ8PCQiQ5n3kkXui5TdD2tJNlhIOP4NadnNf8mEVyW3uhq7Wg1L1DgzKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve/tDQf0; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve/tDQf0"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so5960543c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790879015; x=1791483815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Dv8H1/zE/snIuNiW4tWqkCz7WUGP9hkqZg1+JIUl7I=;
        b=Ve/tDQf0UBNL9KsYUkveTknpoDpj/g8kWh2szirPPSwwN+pu3RME0j87mMzYe03xuX
         q+aSakTbfdWDjXKsKjhKAqK5pcpERbfG1wadznkf0zSsm2HF8YDMYuJCA0mJo/7AxmwZ
         LNSHiNJt/MvA6gORm+Qly0tBBLkWEdeh8cIGI2+VgGqBy7GW1zy7H62XQVgY66ce3Iff
         Si4MDladWyhkXM/99Br7j2EWm/grKsNf/JeDtaVlAmtogV0Axw0c75NuePF2lNwBbr7T
         h+bLXHxTShxCsxRbaYA5NJsphXLu2HxXeOQUitrJVgv9De1MOUj4wfxnafXnOfIAsNRA
         cSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879015; x=1791483815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Dv8H1/zE/snIuNiW4tWqkCz7WUGP9hkqZg1+JIUl7I=;
        b=SerOFbExL+gowrK5JLEex2wAU2OQjSKTfWDXeCvrkcLVSa2Pp5owrpysLE/P5yv11t
         O/11z6xjniFPJ0axl8KLwJ1Yhddj6sdS5AR0zZFmuvEZEqtgXfajAPoehEwBC5Jq6KJA
         LB2AXsfny6tSsHtBnDfKDPSJgQ/auXkvEer+Wx5AIsqEKiB3GylG6uY70rhRPc0dpep1
         cTfyJGyaq8L44jevoHJigiKDXwoOqxEXEZWStrY8LSnTm9DNcFGZ4bosN9TAtz11bPEq
         0ihqyRzNLOWPG/vjfVKBrkQt+WJwEbiHwAMCAckOz7+avb09lw2hIoQc1P7dvRsaSiCA
         ra5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwS05mn60Rzio2UQHFbdf/yMHjj5zFrtA+eCndHZLE67or6mvD9nsLcC1cgLgreWBpvhKcqgwMpJjUt0GE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM4+fN2THvjo8Faa3dK1zBkYs9ZBOPqa8HvMGBP1boL2Tdgv1W
	NKCZBXHKRS2aAVSVXhma9Rc47K/r0gft8OUF5j59UWtMqLtHfN3HDDff5K7aMfCw/o8=
X-Gm-Gg: AYBFou3u6yrhUi2kU1t/IZrPcibG0JZVoxSqncBng5fPmVERAE8NPUnB4zNRXRNszPU
	hiRqDEEHGOtVxxHluWohz+D9Gn73VuYIrDz4mhnbaGCPYJzUPJ9cjTnZmbVo+UhNzn4g9YihCju
	urJD9+My6k/xvmJ63LDkI/CmBeUeGUtysbKMLQ3O7skgJlK171eXwhgUay7GnkZlzFoX07uSdFl
	sIrwrq8owTa1pFsVuMPMAF1PEgh7DotSyBvxvpFSqy3pszVEr+i4bN7z1dsI0Z12UVba1rF+s3h
	qhMKF6zS/CFQ1ZWY9I92oRVE2af1O+Rm2K1Ig3V6XGtXD32Bhujs6cdhvIN5nQoyCCCFKGZj13V
	d9bHLzsvfK6B+9SvxemK0OpP29EXVcMBs2DsBHurc1YsK3tNNTc2VzNlHYlaldGjEGMjAWezWm5
	K4CW5zdo5Mk2zu8kWaCgr60Mbmfrh9/HY3Rd9CTG9Blzx4gHiRufQ+D1EHjX3j44GlmYoAwp23v
	PRThEBVw+xErodC/uYwWSaZK9NTwPBo
X-Received: by 2002:a05:693c:62db:b0:33e:a173:4aab with SMTP id 5a478bee46e88-34f150ab94emr73498eec.14.1790879014427;
        Thu, 01 Oct 2026 11:23:34 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f303e3sm189671eec.5.2026.10.01.11.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:23:33 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+2cf741c3005abc20@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v2 0/2] net: team: fix transmit skb ownership
Date: Fri,  2 Oct 2026 02:23:24 +0800
Message-ID: <20261001182326.572045-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926090039.1714460-1-bestswngs@gmail.com>
References: <20260926090039.1714460-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The queue override path can pass an skb to a lower device, see that
dev_queue_xmit() returned a drop, and then reuse the consumed skb. Fix
the handoff decision separately from the transmit result.

An AI-generated review of v1 forwarded by Jakub identified a separate
broadcast-mode leak: bc_transmit() returns without consuming the skb
when no port is txable. Fix that in the second patch.

v1: https://lore.kernel.org/r/20260926090039.1714460-1-bestswngs@gmail.com

Changes since v1:
- Use list_first_or_null_rcu() in the queue override helper, as Hangbin
  suggested, since only one override port can receive the skb.
- Add a separate broadcast-mode fix for the no-port skb leak raised in
  the AI-generated review forwarded by Jakub.

Weiming Shi (2):
  net: team: stop reusing skb after queue override
  net: team: free skb when broadcast has no txable port

 drivers/net/team/team_core.c           | 16 ++++++++--------
 drivers/net/team/team_mode_broadcast.c |  2 ++
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.55.0
