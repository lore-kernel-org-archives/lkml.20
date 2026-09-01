Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F447CA71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256109; cv=pass; b=GBu4udmtUVzE/hwCcZWBUrB222PJ1tXJDR3CgyynfL8k+/1fklRuwuMuxkigEkmejIcq9p4i7cGA5khswqGhHzDf5inuEECzOMHH56t8s3hKWGu8sZOVak9BtdLWu+PRDdtideft/11+pGCtxp0GqtlFl+CnTaddtE+ZOM5kJoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256109; c=relaxed/simple;
	bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcluR0+EQqAcFEoL9G70b7epnqzeSDNVKB5xgl+c1QA8ra7InWxlxat7jbamlS1zhdZLRAeyaYY4vyfNkeX+jeenRhEx5XhtojnoLV8E01R17aQmhfuz7y7csiMrhUlsrtnFNkECNhYq38nzArBo07pj5M+MmALkbwO8miBICFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekDHRyjc; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekDHRyjc"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso874113a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788256107; cv=none;
        d=google.com; s=arc-20260327;
        b=lmTQxtwVrt7Mu6K4cwZfY32qy1m3K2UuHNrqwIqeTp4pLTr7SO49aTr5FP2xpB192C
         iPVBUNXDx7Cs3GK98YXl2tCECdEUImkJi0Av7Eockfc3I2owtQMCqnKYWm8JkX0REMTD
         qYQvreggjUBB0b4KlnDRFPeuyvdCgI/a3Ko4C2aw0cobke5p5pJ+qQoRBgAWxYXTAMHV
         EnZCUonplZCN171jzP7Y5sFMiYitNhUM+Rl7NoLsYh1aoFEjGyv/G8oM9udnuKL5xxRY
         Je9KLVOVJkpIOIcfluMFcFq3xFtI1fZPwQbfXJFCaiAKbVfaRLUYVj+p7gerKK03D6Rb
         4CAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
        fh=jvGgAEY12wLQDmFf8LWFdMZK71NH6fJO+bBz3t6oSDs=;
        b=GKbuW5P8Cq5oPxC8SK5gBdu+3OjlmvIT6D35dnJSKc///8CRT9n4k0fGYbJBnG9CNG
         oAnIPt+AbbMX6XpgrMF2j7o/W68/Pc8lQqBG5Nj9erIaFCaB/D5dTpvZ9h7RUEZU8kCY
         2dN68sJEiVWUIdgXksQT3UCeDFRZgO3Bw0y3uQZjZuuWlb3Y1O1eIZ3ZcNJhCEZNIsmf
         gd72g3PvXQRDfNGRL5NhwtCTe+o/JYvMEZEaLxWPPIrODJzLGooebuQqZe9cyRC48S3F
         wZMMM0cLNqOZXheueKzhwflcpsOq/CAE1gNCAkFjE0HyOVQG6bdXW0H/uVNKKViE6FYm
         mpHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256107; x=1788860907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
        b=ekDHRyjco7iu0DlNb73FH9CcuUoBm5GUuAxdLyUtbIgGBzh1SF0FpkVle8n5fSSwux
         J/0X4UH8f88okINWhT8vRP9C5cP25Rgz4qXwmTJLOYccvRx1Ahe41cLn8rCYTiXQ8aY9
         rm+BFwIEV+61Vj0CNu/O+CdqGA/glw9Zcg30KZ1Hizxa2E7Z0c0n3ZIS7wZ058W+C5Di
         47FcX3gBrJWZnAbQ/KgK2QbYNAngrpneVdAefVd3KdDxgcGdJF+4Tl/PlYgSehU0Vp1z
         O26kd/cUDJX8cMfmfuHhMU22RhpgnCfwoUxs9rpUtvzzH2ouaVN6mPzrtGTquLGOLsYo
         vyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256107; x=1788860907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFrGWGX0qCMRg3Udva0da7KMgwurIr7BvnyZ8jdwJsI=;
        b=plwcepLeq4RmQDANANFP8slfKf9FaewLfcesHyohFTp2fI/UM3VBfheVTXRh1ecqkY
         h6qPLrS6CPdTzr7PDMWdCT5/YDiKc2qxsDDGTZe8UpxF1WTrpH4JQ/YzXqBFFuug1Dhu
         mY1RJzM+ptC0TpU+42rplUp4oCHR8GjQ2oxuFFXZkaaLbcpJEZvOxQBFxkfTt0TwSfFV
         rYXRhjk/xb2gZCEGjZJNSqqgN9qc3QcbVOP6duMHXkpg0tBU22OWhQMM27U0dUCHdBcQ
         tLJt+PuHc2+0aAgRulhwVBYWOEGaA7kVyqNRX+OamJNqWfx5w8uKedXrvJCD4qsQXN2O
         2Eyw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ81Js3iLwbq5Qf0cTZCWP6t2TcJMInPkpaUWMuC5hBb9NN1S0ISGscEEA2Ul//wcxuHi4bn4gCMBvnO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lHmjUDhds1OncLOvCwgr7TtOVkKdScAGQnPYKBKaVK//9/g0aK
	I3sG34RvxQFf1CHUa2MQjW7SZVodw+SctlwT69SxXCngayXnnFsgPk+W1V/PBqOwPc50A0tmzP3
	/2T5DHFbP3XmXe6nb+zW+71o1kz9HUx7ZnQ==
X-Gm-Gg: AYBFou1qKPnRsJfK7uusGbDl96yNRnqMorXbrT/BEX+s6oFykAMUV96/PfI/fmuMZPE
	a9cHtB9lV5DOHwMZl1v23WBhaKQ5bjnTpkAZfRCXrUbsiO14RTPPFlDDB7aXFwLj7d7e6rNBCw7
	SEPsn6Ey0r76LLkiBIiTvZTu57yLgQ5w/UOpAT8etOXT3AApoqZcXAfUL/JBvVDzxcVF3g539lw
	j0ZsxiaWQuSm6mGV0+9d/FetQu5oOLfdcXo7MZHDviW/U2yhdGIDrpHvo1A6sOxFSNZIYup7Wpw
	aWfCYQn816/XRI7cfnKdRBvjlLqrUURGyULMjssyDSLjlK3YVBprpc0Cwtt3wH8xopsWw+yhz6U
	TNraJGvho9jUNGcRpOtoh8TKU3oFom6Ut3biBHbylF3+KFgSAYSKP3pJ1CY6F
X-Received: by 2002:a17:90b:17cd:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-398bab2710cmr16901480a91.2.1788256106694; Tue, 01 Sep 2026
 02:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828133543.2259029-1-georgeandrout13@gmail.com> <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com>
In-Reply-To: <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:48:10 +0200
X-Gm-Features: AcwNN1XVIbAOkbhlLBnkS2GohT29f8zxOg3ydr9xAyhsBXgZiNdFLd_6swEjYYY
Message-ID: <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Georgios Androutsopoulos <georgeandrout13@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Should this be `Closes:` instead of `Link:`?

Maybe -- it depends on whether we consider this kind of documentation
hole a bug or not. But if we do, then we want a Fixes: too.

Cheers,
Miguel
