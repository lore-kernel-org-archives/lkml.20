Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8914022A4EE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203531; cv=none; b=YiBdRRv5SqbbYfjln1zI49XSyBFY+j4O5SgS1Gxt9Qto24J7jl1EV7DLZSSikQAnHrAqhMWV73Zdhr1e8E1JPybJmOiDl5OTQy0+Gxs9CcfqWQ6eGV2d9TbMIH+T1JUPBU6mftJHfi0Se5pCv3WYVnLcycx7BM7WYTHh0qmpwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203531; c=relaxed/simple;
	bh=tWVcT6JwHJnc3d53UK7tUHvXHwCvOt2tIFjp3h4BWSs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BKAiN1WGD5tfy18t6+RQFuRgFcVNOkV5VRODH/CS9XAAcdF24qu2sq6vGN0gbw/6+/FPKImtBnsYmoexSi290NJEfClM6/fWek73wZMIni2Srr6tR8bHRUn+L6W+6TTQlcJ+mbkwzPTAlWtw0gmP6ABAjJ17/K7TK0+bu9kkJlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy66AtbU; arc=none smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy66AtbU"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso1017568c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203529; x=1790808329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tMHazq21ogGHqSDoBKzZAYFbxPofg+lpr7Oo8QXp/yQ=;
        b=cy66AtbUJ1VkhLXnQaKRmtCBBoshqlI5ak+MjPdXfk+pX9Uv/pcaiLA2fuJC/C0u3O
         +SMUB3SWO7nJyBmJfJZmcsUWpPUrhAhGyPW5ZMqUWL8qMHijq1dy8tzjVy5FBo9TxYLH
         rpBPwmP7gWRax1WTlPqm3Po22hlUvO0Zy/C/XQdXQI18ulFQ9IwMia49aoubG4HCA83Y
         kxmevIpsnWdLuoeQil82/rvFaBZ8MEuIZxrjm5RyI/j0+5xDhUVJRaFX4uT1WhgfuXOh
         xmcH9kfY1C4MjOb3oNuUdOcZmMgJS2vMG+gkzzEJ32APi6y56R5kLV6qCnTMCmQ1SoeD
         YnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203529; x=1790808329;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMHazq21ogGHqSDoBKzZAYFbxPofg+lpr7Oo8QXp/yQ=;
        b=IRrMqQmW+wZMD73Pl/c/3DbCXSfGIWLhCWu4DL34mHU5LHobcfpAZ1puY45Nykz5QG
         ETUPodaLO1k0XD+KWDd3z3kXWPkweKPFSFsqIAJURrfzZHf1hT7X4boys/Jd3qYTl8eg
         mVfEgzRaR5KuL6YANMZ8JchYvR6yyQ/+KQ3krwxiuXDB3o/FzYo3+VlqMMrUvo3pLqfL
         XLUNQ6F/54DD0XEvF6QiCgNy87Ay9TWiTB8himnQItTTgDN+Wsr+cQ87wmTj3SDGNTEy
         GA+9iS/rB69rwAjFGze4TzamTsChv7QXgESz3OA/R1MrD/t/Z3/NJpILq9sLDIlVcnhB
         ZU0A==
X-Forwarded-Encrypted: i=1; AKwUvByLyr0hw4ux1IY3hdwjbJmZiEzQWtaG0zU/hsKDgBeST7i0q4DA2q2r1YkCQgdIybY0nzk1CViMRuSoz7w=@vger.kernel.org
X-Gm-Message-State: AFuF++l///ezhgPA0aHbqBeVR1+KsDxylvsMNBsSUbnxwUcbxY5RRsTO
	dGEziveDJJrjX7wShTMTwr5KXVB6eOcIde3yuTiFTnkM3UHB1zp23189
X-Gm-Gg: AYBFou2ZA42PIjoTVCVCxxs3JigmPTzIaV2QY0kXvALP1gkTbOqiHSTXnAE4bHn42kP
	nu2P2vN0AwGeaDZEw3uwHNNDOSWlddWSoOKiGmvVvE76Tg/QomOOiyN9qqBBAd7UsdW6jyNvWLH
	RBxiVP6peW2KaBFJxX1tBB09t9OH5s1p4432pSZQtCU4Gv88y7QzDLh9rl1qAvrswfvj3uhIcqs
	L/srN9bvyUnipsNlZdjPXWTuorFHTeIOiSG10S6TjZUS04TZ34CDCtdvqh7sZy0ni7ABma2bymX
	gZgfaEQx3UnhAYhIBuU5E/ke6/OwmCZf/1YXScjYENhtDhXnvnWZ3Js6OW4ZUY2IC/ha+j5Ot4Z
	t3qlv80OAHji1gcv64feooBYU1Abd+j6gt9ZTZWwvk552g11s3vAbOtA0JZceqFKMwBjLSuwOok
	CFfgjvqyUbwZ0PaA2qq8bfUWwNUuQ699RoMkB0D4VsWnqq+/t4qvX6jMnCBjGL/u6hw8aehfu/y
	skQ60+VkePo7YdhmEF79F27bO2Az245eFKC21F5uKdJNialLR/7sSbQTTCUq4Fnmena
X-Received: by 2002:a05:701b:4286:10b0:143:2968:564d with SMTP id a92af1059eb24-14503fde4dcmr416556c88.27.1790203529383;
        Wed, 23 Sep 2026 15:45:29 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm7915545c88.10.2026.09.23.15.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 15:45:28 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:45:28 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Aditya Dash <mradityadash@gmail.com>
CC: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_5/7=5D_HID=3A_hid-lenovo-go?=
 =?US-ASCII?Q?=3A_normalize_calibration_failure_status?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260923211458.32755-1-mradityadash@gmail.com>
References: <836F1B09-60CA-4A82-8293-0F9CF506E593@gmail.com> <20260923211458.32755-1-mradityadash@gmail.com>
Message-ID: <71564420-F3C8-4963-82B4-D23A6815D688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 23, 2026 2:14:58 PM PDT, Aditya Dash <mradityadash@gmail=2Ecom=
> wrote:
>Hi Derek,
>
>According to my observations, data[1] seems to give the correct status
>instead of data[0]=2E
>
>device_type in cmd_rep seems to indicate the left or right controller, an=
d
>data[0] the calibration device (gyro, joystick, or trigger)=2E
>
>To validate that, I ran the left gyro calibration on my Legion Go 1
>and failed it on purpose=2E
>
>Here is the raw data alongside cmd_rep, its contents, and data array
>
>  raw        04 00 a0 02 03 01 02 01 00
>
>  cmd_rep    report_id   0x04
>             id          0x00
>             cmd         0xa0
>             sub_cmd     0x02
>             device_type 0x03 (left controller)
>
>  data[0]    0x01 (gyro)
>  data[1]    0x02 (failure)
>  data[2=2E=2E3] 0x0001 (reason, little-endian)
>
>Reading data[0] as the status would report this failure as success=2E
>
>Therefore I lean towards keeping it as is=2E

 Okay, Sounds good=2E

Thanks,
Derek

>Thanks,
>Aditya

