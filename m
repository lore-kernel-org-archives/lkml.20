Received: from mail-pj2-f17.google.com (mail-pj2-f17.google.com [74.125.227.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321447F789
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.145
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327704; cv=pass; b=ncOaDlR5Z67uUw7p7ic2TQ1kaNtxoYclH47CyJP6vCnwxPSfNXNBzQg43ln58xPOCRTn1AgtmtPWcKKrs43XW0hA9Z0Tqh6izP4S/Bi0D2804JOnQHSqQElqn+jmhkw8L6JZYJiyceIEqRDbzrv96fFQUSDoffmBgaxygujhLvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327704; c=relaxed/simple;
	bh=p9nwhpNShwsCELITN+2tBnZ+go6kbcsWckBkl8WHBog=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=g0zlaNoHrH58dk8WxpOvfJNKRq4hU/tOd9I9stkNr//qCQ7MLK7E4n6/W+Y4sfDN7aP+lmYxNu9PVsGzMb42anw+JPc2lnKSs5KayZQsKPKiH1+WcWOAdvunCZJsv1OcFRneE0iMzDkcpqvIXyY6ztyS45o6lJTUVGwxc2BycOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+B9NSQt; arc=pass smtp.client-ip=74.125.227.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+B9NSQt"
Received: by mail-pj2-f17.google.com with SMTP id d9443c01a7336-2db1ca06a25so2381065ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790327703; cv=none;
        d=google.com; s=arc-20260327;
        b=Oe6obC+FMpZLnbNzO9G6/nKJEC2gnRb0Xx0cLdaE3JdXc0W7sqRbnNiiP/g9l+xFqA
         o8VDFMVBH+dz6Nr6ejJPH3dy5Jzr2dZKbT4XWxW6qHx25ddVaBYXI28KWL+fQ/f9wwEB
         1raCF6QeFf1P4u+Bni/teWxN85iZohNCnGnakz/s/ufOQvDnE4+smbzqMrk6lATfPbWD
         gHrD++lsx7EBjTmAVTVTbTLhYQC+yN43rX8sykL+W+iCdYCi5HSWFlhnkuM3ihwu41kP
         80+krgYyBPifgq+UMwWi9pbUe1cT5UVuUIBJCH1dryYt0VS9DqODURSX9oO80wsE7heD
         uY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=p9nwhpNShwsCELITN+2tBnZ+go6kbcsWckBkl8WHBog=;
        fh=23AlUJRAU3YsohmV2Qbi9gtfKdlsXry37P0HTCJzKOE=;
        b=QhXpsPRU1/PqXH0vqzW9mXysjd/uZxFvXsn49co1Obaargrd2NAK1v2nydZZbYRu2d
         l/UYBqgAjJ2FzpFmRXPeL5H1w2VBAZGoz0nA1Fs4qLHxOqmLtvAJI4se7q98fffpYMgt
         fyJHzu1zn5y2Pt0lpRl8DsTzDoLCNerSEEmKcmHRV1rqyGd2yn8XlrtLRbxhhxRjNv+2
         ux7zvr3KNQf5W2CpKfbY7lpK6WgbkPsu8TQH6lzmb/EcNkcuG1E70Cx4xw0lz9vA5Uqd
         TjDielXYO9sNaGfAZC5jV0HPXjICQC1wTBcVHZn+5fW51pRXTWlz2EOIdCxKE+gfS0Ps
         CYVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790327703; x=1790932503; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9nwhpNShwsCELITN+2tBnZ+go6kbcsWckBkl8WHBog=;
        b=V+B9NSQtCML/QWFyIgYUTJooTNaBUy75und26GfpBKEljRnZ1pJFMS65J4GeSRi9GV
         yfHv1ZnwVV0KrmtkOQvUI56qcf1x4H3vqWAI06vd2XUXlXSy46dSMIupkqGHu42gtdCl
         7jNhTmP56ejhvCd2BFOOgTK6LqFgYMIvUyme920D4c3dMUnaOKwq2GBkUcEe1dBQbgYb
         Hd5GXcAEULg5qhrjMDIw6giKOP+ShKkAXDBiAAkh7SgagMCklWn6/R8r8d7qFAUyxajl
         HhtQPeclf/FVPoCPAn1rAOZFr84OQN6jLUNQmMX2ldg469CBbDu2FM0mwHh8GD4ac7tQ
         DPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327703; x=1790932503;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p9nwhpNShwsCELITN+2tBnZ+go6kbcsWckBkl8WHBog=;
        b=K2nSlPSKJHofMc4YJCtx9Gpkmgbrg01VkE+1LzO5Mgp3RPUnm1Nz/ezh69u5XY5HZz
         k6vJnnGBIi4eJDzhur9OFybXi7d65QF47GiBWZnAlaaoBXgAcL4MMw5wjaFsHtxCB6IQ
         mP+ynOxmlFVqH41SgbkkSHGUILQeUv74llNIB0xgmuPQW9tIi3bJqoF6CE7hddjva2NW
         3esRcMlu22Mn6qt4tbaSRTnvFfEKt+T5RutF8QMt4eNFGRGhot2taNCBlWRXNmwhqPhh
         kR2mrv39AxWSNyJ08eypkZG5XEP0YryGjl6UhokhwVSihrZRvmrQl2QSgVzCiX7qdhFd
         82/g==
X-Forwarded-Encrypted: i=1; AKwUvBz/Gat9p7poNjzXm1NDgfzMoSVDTnI+9lADxKh7Bj0tovIcCtM8epgqJ5bl/S+6prB0xOVfxYvV9BY+edw=@vger.kernel.org
X-Gm-Message-State: AFuF++lbLpOfZS4m7VgwMD9HZUjYRSeQ6mp/T1vDptfdTeAjKwcMR9ZR
	CnhsfVtZqPngLWPyXZF9I2i1Q6GhfURuydxZomSLwWfocToWnM81CAAfv1L4Hqv5QxsJSIs+eG9
	uJQl+ugXMYIi93FEVER8FukQc95scjmA=
X-Gm-Gg: AYBFou2GjG+EN8kpO0Y04xhqLRxs9vEK9bqTjHriA+gdD9kBO2VYdeKeSaRm09HG6R6
	yhvo2vpsDtDU3um7nI0QMbh4qLHY5Mu571KH/GtnlFAYgr7ZUe6mHVkoKYOheg6b7FEjBq8j+re
	KN50ySAlQQ8KLZK8zYiGQbYQKILwOpe89SVMdtmvbtCXNjylFbeckygxFwV38VC2fmqM99cm7sD
	7JQdf/n9aWt5CVhpU1tmkVgs30R+J1LM/Y8BJnrFL/qR7EtqZ4utwcbNDnD90p9p3oFGFu5Ezh2
	k2U857UTppVts4IQURYfBTIqJYX9tIcsoalRNkzF2zmeyh7fqEeWHA==
X-Received: by 2002:a17:903:324c:b0:2dd:c100:80b5 with SMTP id
 d9443c01a7336-2df7e6644a0mr38012105ad.48.1790327697988; Fri, 25 Sep 2026
 02:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?5rSb56We6JG1?= <chengjna@gmail.com>
Date: Fri, 25 Sep 2026 17:14:46 +0800
X-Gm-Features: AclHuK93wbhjjM2-7srtIZwrbaXXOw3HXafZeMMpj52e39XQN_y1Uupp1neqqdg
Message-ID: <CAHDTbUFX=8aAQnwv32hqmwHKkeJR0UA5XfZtMZRD1H+kV7uCzA@mail.gmail.com>
Subject: [RFC] Proposal for a standard Competitive / Protected Session API in Linux
To: linux-security-module@vger.kernel.org
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to propose an idea for a Linux API intended for
competitive games, online games, and potentially other applications
that require a high-integrity execution environment.

Linux already provides a number of relevant security mechanisms,
including ptrace restrictions, process memory access controls, LSM,
Secure Boot, kernel lockdown, and kernel module signing.

However, these mechanisms are currently exposed separately. A game
that wants to establish a trusted competitive environment may need to
detect and combine several different mechanisms on its own.

I would like to ask whether it would make sense to provide a unified
Protected Session / Competitive Session API.

The basic model could be relatively simple.

When a game starts, it requests a protected session, for example:

competitive_session_create(...)

The kernel checks whether the current environment satisfies the
requested protection level and returns something similar to:

ALLOWED: the environment satisfies the requested requirements;

DENIED: the environment does not satisfy them, together with a
standardized reason.

While the protected session is active, Linux would protect processes
belonging to that session from unauthorized interference.

For example, depending on the selected protection level, this could
restrict other processes from:

debugging or attaching to the protected process through ptrace;

reading or modifying its process memory;

obtaining sensitive information through /proc;

using other kernel interfaces to observe or interfere with the
protected process.

The exact interfaces covered by such a mechanism would of course need
further discussion.

The game may explicitly terminate the protected session:

competitive_session_close(...)

Normal system behavior would then be restored.

If the game crashes, is terminated, or the protected process exits,
the session should automatically be destroyed by the kernel.

This would ensure that the system cannot accidentally remain in a
competitive/protected state if the application fails to shut down
cleanly.

A major advantage of this model is that game developers would not need
broad permission to scan the user's system, inspect unrelated files,
or monitor every other application.

Instead, Linux itself would establish and enforce the protected environment.

The game would only need to know:

"Does the current system satisfy the requirements for this protected session?"

In other words, the API would provide a trusted execution environment
for the application rather than granting the application broader
system-monitoring privileges.

A simplified lifecycle would look like this:

Game starts
|
v
Request Protected Session
|
v
Linux checks the environment
|
v
ALLOWED / DENIED
|
v
Game enters competitive mode
|
v
Game exits or explicitly closes the session
|
v
Protected Session is automatically destroyed

My main questions are:

Does Linux already provide a unified interface with similar semantics?

If not, would a Protected Session abstraction like this be worth
discussing as a generic userspace API?

Competitive gaming is the most obvious use case, but such a mechanism
could potentially also be useful for other applications that need
stronger protection of their process integrity or confidentiality, so
I do not think it necessarily needs to be designed as a game-specific
API.

Thank you.
