Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A0535CB95;
	Thu, 15 Oct 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034205; cv=none; b=J/EG6ljHHgEKmqjSgEe3F67RflrsPuxJ3hROclvzI5AWZo2dYxIErMuOJ/uPn40pwGdCrxV7nncHB+/WxkAxL9xebsedsJUak4+UWRMJdpy6Wid3gEJnMDtFVKean1DDVPwe4bnlSYVMNE1ivxvmIbIMYlfX2eMcnE8SLMsvxEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034205; c=relaxed/simple;
	bh=dHfT1khTObQ1cJOjowSyxwCQnvOB1cP/o2ky4LCuI8o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=H3ltxX+hStpZ3CCKalEN9RPwv0gx0Ppg7gTLhIU1yOYWlm9DNp3lr/h498P25j2nfcEPzeu2Bhonea1G+fE782HXxjg6yI97cemT2gcLYO1MnycZ8FvzPLN3/vjEHvikaMKsd9V2n9az4RRZ24DTYP8AWCI2w2zN+C3+0ZR3+xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcdzrASl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcdzrASl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B851F000C4;
	Thu, 15 Oct 2026 03:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792034204;
	bh=dHfT1khTObQ1cJOjowSyxwCQnvOB1cP/o2ky4LCuI8o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=UcdzrASlu6ExcqdpbMxYXA8lVkjTPMHToxvMzjCZ8Bh7unDPSJj0ACivBYz2l2uXJ
	 eZI3UJn78pbyyk0GGFRs+iD8BQbBJFGOmzY8QMRb7OHHOof9Xr2zDdiR3kbxfZyKD8
	 exuIttOxpyFQWYjT9ASdLKsMsFU1jJJjIzywsXgqKXDMsB5zY0J0KgkRdppgJ2AltM
	 3gLPNRjzEBngmTpairRpXfgIKqrqfRGQ/YoVtEybnTu6xboZwpP0f85wAYfo4sqsGG
	 Itsach7MG/B0VH1eRFBW6iE3bid/98SXx7f0gGB2QB9HYKHhHqQzkV/OHp6OMLqy7s
	 iV5sSCFsZVpdw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260608-spmi-bus-register-fix-v3-1-7fbcc65b2929@oss.qualcomm.com>
References: <20260608-spmi-bus-register-fix-v3-1-7fbcc65b2929@oss.qualcomm.com>
Subject: Re: [PATCH v3] spmi: pmic-arb: return 0 in spmi_pmic_arb_register_buses() on success
From: Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>, Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org
Date: Wed, 14 Oct 2026 20:02:14 -0700
Message-ID: <179203333416.5720.18209688504652640138@localhost.localdomain>
User-Agent: alot/0.12

Quoting Fenglin Wu (2026-06-08 18:00:59)
> The "ret" could be returned with an uninitialized value. Fix it.
>=20
> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Applied to spmi-next
