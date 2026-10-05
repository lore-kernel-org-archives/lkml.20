Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9D36F90F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231299; cv=pass; b=HSGVq8/U2ygON2sLEDsnG++RfWbtR5ZDsrU6v0iaGSBR4/WMMmxoe9QLXafTsY9MXOouVL56O0K737kOIm+TJARBoOYQ7ZLUaNCOanmX120hm12Xdq6C55Ciejh08dokYe0zxzTwiNCUSsxUr+JZWCb1kxEeKxCVw0K5mZBJQQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231299; c=relaxed/simple;
	bh=Bq1UAZX2PNyexZm1nM9MHPN+8GExNYB/82CSsEV7ikM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Dg4CtO12ZWu5i7EUXNbTAykFHK1BWaT+FKCHws4UhL4GNI2F8YD7guMyn2OYLLH/Kom8CgRlCFGhMiJu3OlgxrtCXUoa/9jBN8c62cpgj9ndW07zS7qT6dT/ptTsIteb0LpneI5fJdpV0E2Bh4QM9txGZ3JNVMrrAyiaXK0uatk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1w6kGNq; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1w6kGNq"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144fa6e60bcso60845c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791231297; cv=none;
        d=google.com; s=arc-20260327;
        b=SI5ntDEC1yNijrmIVhvlav+22V7QU7lWd6lBNSwlhwRaYRDqVyBZQeopLC6VrHr4xn
         3qBcUTnZsf7Y4QGBiTkBt1OAc/aKO4Z6/a6ZzSbL2uK3gK9bqOeWFocAAWC2qtftJCUA
         UMw38WakfqvWonjSeQWTCvvEdjP28JZbMrHML0mrqVvvaz7D4Lg/FbLdREo1kkMtIHsa
         ghFCRJ18Gxnq3nMYcz0yww6KzL/S8qtbPeZRwZd2qjIVVel6K8gVjjYQBootuPP4XFbz
         vIF31q9rGYKRCkQlK7GFwUbcXmSZbVwGluD5HHL9vNcArqd7gWELcIJ59Gic/EkQ5CmA
         /t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AMDrs/XT8ZcB40o2W5+io947QcRQ068ng6Mvjz++tqs=;
        fh=9bdGpe7w5pdodUMSZc9hv0GQhWXnUyUr+sgk5l+/Nio=;
        b=cHo1zU3HFOvyhlvBSp9jopLtksmMjsMXCBtGSdGWjGinOz1Kd73S7yzT/4MFzI3q0O
         MqODi+ra3P5YycsYJANvaWT9JnsFxvrCMeL5ry/Am1e0aSGAdr/+JfogK1+OMKd2z7xh
         DvueC59s646pWUQg8qqq7Rv+R+HFOMaGyw8YVihAH6AYqCjIqI3NmpHig6ndf2VRZOC4
         Wsb3ffNnxv3K/A4yHkIY/UewK9MG3BAxgVAz9tIcLWy0BIwXIqBNspPIMKFXrBaMagHA
         8i4Sc2pOb/8/tyfFeh9XfpZu5bqCNN7plT3KocfS5vNT/WM5t2Bo3Y5U8uJ0ez9Hbf7l
         5A2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231297; x=1791836097; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMDrs/XT8ZcB40o2W5+io947QcRQ068ng6Mvjz++tqs=;
        b=D1w6kGNq1eQdqabGyVRNw4fURXrpNVwRA7Rer/zqQ9BtfXxFeLDHHolk131Nz+m/7l
         0mkF/SBkxiz1qX1hXllL+Ucmq5UhrNCOtbNkwTdKHoJ36f1PahVYtDjLfQj+sk80PhJL
         hh4JVydqt82bznSjn30rfHSk2BtLPHe9MBlfRs94f3FCHiL011ojh54ze6NzZ9VHWtGT
         Ng28rKOqbKHacatnnJ2OjOmMnCC/Uq0rLOq68gjFLIQJ3W6vT4VjG3dA/s9LW6TAnam6
         tUIjoliUM7UMuma+mfoq/NvWs2U7nycNsn3iz159wKbkPs7u/YVQ6MLtKen+2NYrJuI1
         7L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231297; x=1791836097;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AMDrs/XT8ZcB40o2W5+io947QcRQ068ng6Mvjz++tqs=;
        b=qA1xzstP0ThjIsZxAfV805OtUHm9lPaFCXDcOSW1ioF77o/+AJOgLpUsjsp+HmLX5v
         IxaoGwnI8PlbdO7dFfP96D7hdir8FxsxCEwLmimdH0TR7Zg+LDy+VBuuN7/8IOzP1mda
         4HEIuYG31tDPVbjB/46Xj8JX98Z3fho+wYEUvQdklUHUk9crx75kNs+hxOtwyBQZ9Th9
         KRC9dv7GZs9Eu0CpSA6DXEmypq4eJKz/oe1ibZ7iSGENgm1e4Q/hZtj1IlGjJK00HxXN
         Em25EYd3aLY8SYF4qSR2+xUmoLjEh/NmR3VLRx9o7+11pAbywqOfdqHw4dwvxKTAW+pE
         iY7g==
X-Forwarded-Encrypted: i=1; AKwUvBwXmUH2aJeB7eespwfjOu/HnSpeNayqdYXK8qjzFbIFOnn8Sw4qA8evwzDKdbanBSXlfwExyuV0BycdA30=@vger.kernel.org
X-Gm-Message-State: AFuF++mZLVeQbEX99GU5JZwd4gwiPcWruvPoXLltpsxRWUfljc0zKWkf
	y+ItkFYs6S0CnpyDijpBOJio9ezf8wx5FP1zaNf3odik9pDjt74aZAv2tCAGH7BThJBZLgIR6ZS
	+/S1yAv8QjUcrIEq/ezP3or5yDxb62Vo=
X-Gm-Gg: AYBFou2x1XIpdMyRVbKH3XEvD4bkB0MFw/l3Bm4mcQRf4hm4PkWDnEUVoig/7mhJqGs
	DBOjAdr1fnh2iL6HJXFyJ4x/eIKKnKbkINurnFfXQURsLKjYczt39UudnEvOmoV2QRPRuB37r+/
	8JZjc2IkwnTA5z7JTnfITeVb3zEwNvIQ6+AZg9vSs1LpXVLUWVQ9uqW0SXJli4tLft/6vf8VMrR
	ZKGKIle4aJjb81MAlimKMvoK2WBTA1JrnYJ4Mw1qwVMAPSrkuHHoqu425przv1N9Sk5rNwlqLap
	7JR5YS/54clH0apjEd7Duw+UFrUAZiR7FwEC07b3AZrvAIL1P3UswxiNBd1aCBetq97MuPIOGyt
	AmnxeQZTDBJjCgffGlFBUIuGov8ixSqp8D9a24RQ230CyPE/K9/Ji
X-Received: by 2002:a05:701b:424d:20b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-14f5aa4188fmr24322303c88.1.1791231296682; Mon, 05 Oct 2026
 13:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Oct 2026 16:14:45 -0400
X-Gm-Features: AclHuK_EZlkeYKVOf5yOf2obDYc8_quHkQ2koc09s-PajMO3v5D25hjL-FV-od4
Message-ID: <CADnq5_MO+ZNOzW+_EH+gUYZ27X_ggWJJ0XdK6m2QW53m_ThtUQ@mail.gmail.com>
Subject: GPU initialization failure with kernel 7.3
To: Linux regressions mailing list <regressions@lists.linux.dev>, Linux PCI <linux-pci@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Christian Koenig <christian.koenig@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

The following commit causes GPUs to fail to initialize on a number of
our servers:
eddba19b8b5f ("PCI/AER: Support Advisory Non-Fatal Errors")
The change reverts cleanly and the GPUs initialize fine with it
reverted.  I've filed a kernel bug to track this:
https://bugzilla.kernel.org/show_bug.cgi?id=222095
Happy to test patches, etc.

Thanks,

Alex
