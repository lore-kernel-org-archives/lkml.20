Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788687;
	b=XMjj/0Z/IK39VrAN1CMx4lQDlqkX9om78YFvkiaKPipBxNdGsvFP0rmuZoh27MvlePbX
	 dSDpKZmXXmFyGTJSItX+KQJH98AHtn1eSuF44DdoYlZjpgQ34Mq0HkmGPVmufMHfAqm4S
	 j8pQn55MyQZs5TGZWliM+RCvMaiCDPxaOORmCAdskBRS8bHZcbnHapdwY6bigVF2NGkVL
	 BQyFug9sbvGft+UM94ERqS+3Qnr7irOXmeTtHnDLGxPHvtqMWFR6CaWVVBKY1bAqjTfMK
	 rZONbz4qfJWfgPNiMimjb9dPxEMhrlS3DroEzfQYKQvv1lOwfT9wowCrqwUUDcr6TaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788687;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9n/pLmVLBO1xSvqrcc5l8DCQ73/BwCkPfuQds0R4soE=;
	b=obyxdJK6lkFPtbRoHaCElwdnZzcjssQQsUd+hFjY7Yr1oaBQzNTQV8lsExhHD8m1XoDo
	 W1PBxz8QEKnOyjF44EbEsA+OnBLPmd9rBAHhByiLz2/GNVXjwjgFroMQkEySihFnpEG+B
	 8HIytIMVC22H120dQAl60m4RqSRREkwblyqY0MOWVZebI50vf5CRTh9rQXOOcwOKdLMXo
	 ajUh6sf46zNqpA/sl54GiQ3Gas6jeLJpwi94fiRFoUxio8D1X7fYA/1pWQGhv1Vl4J8Gp
	 0BWayLEJ2HrwB+YK4hFqaQSUqVWxPXIzajBEhPKJgWQ4fSALylSXFtWviZsctREpAUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bjn60JeU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95813606A31F;
	Mon, 16 Nov 2026 00:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bjn60JeU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74FB1F000C4;
	Mon, 16 Nov 2026 00:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788687;
	bh=9n/pLmVLBO1xSvqrcc5l8DCQ73/BwCkPfuQds0R4soE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bjn60JeUTlCgALSpH6exc5WXwMEiQcEwDkI4vyZ/Qib/fh89LRh72F6nC78Q9Lk2q
	 R2lwbzkDb2Dr8dD7oHTVx/wkq8fE89ZtPeD3FsysEDqbDzP9lhoXYoDRvD8wm6iBiZ
	 TtR2C/but+lpOQ95G0e0UPdyykP5+UA+YfVVjJ0qIZCveFw8A/YWSUTgoyVd6/ON3r
	 m9eCPZ0uBI351W6SUDCfdgu2aeWgbgK99YlgkkH7vDvMqo1GkJvedIuObZSg7ClKUF
	 727Z77ciAhZ5pUD3uqa97klDJZjOvU2p6OA/vhXBdI+iEP/iTFiJ4aIJT2jxRD9PV2
	 tKzRuP5DwLobA==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to
 set_remote_state
From: bod@kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com, 
 abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org, 
 hverkuil@kernel.org, stefan.schmidt@linaro.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 00:24:41 +0000
Message-Id: <179478868199.2420435.11128920537220174074.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=bod@kernel.org;
 h=from:subject:message-id; bh=PP8yCetF0xDIn3zljFhHH1y0aHizSwM+UsTLODkOZ9M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq+k1KAcb56EElf2BNzPqBhHa2ZnK8ofd7zqiy+
 WQEAZWIXXCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCavpNSgAKCRAicTuzoY3I
 Oqm/EACxdLLXek1F7KBt+dC3t/kwXq5Oaoaz3Bm+SVQn2gqicuK/BrP4ZGDrtNm+/FH9QxDY00e
 9b4NNCVYk840Kqp3gzJ9iPBc4vos3nfi14GbjbjSZAHRvrrb+E9QSTu6cDyDY6tnklpQJtcOhNq
 M9F09OVBZHDJsJ+x6FEcuhFhpvA7m1jz92WuUg32YA0/aP8HDxNV3eo4EtQqAGvbPWr+FXrMeQT
 j0jpY2rSMrsXmJRTxBX6eWV6wlrJc9gVC7oItBJsFdotehG93mGjgYrOOXDjr/+lBnBKw2ftAm5
 GXEwgR3V0bcgGNF/f8Jba3kJJA9CBZxWbh6B5K3CFWQZ9BM/lhXgI96oYbsShiLxVRzGp78CZ8A
 URO1PpcQGFL495P2X2whcfUKyqT3adnIKNvG10zZUzUbpf5GIsfIA1QL7OIwiGmEVNGddru33je
 WwXBvlksxQ+q4xmvk4YSjvSYnZDE9js05l93Lh7QPXUMiJeQwtEhLF6rHBJPZbwrqkRrbC+k/+M
 jiWdG8EJPxPfl3Po2aLCYvv7C0aYHmNq9EUru/lfszBZi/KbDdKLQnzZl0ltifRsk5MWQdQVJe3
 DPYIpukGriTSMJAvNScqEvqtTE/n+drJ53+aqml7LSkwRdTUPZDsWyfNVR2BATFs/D4kALNoLvN
 DODYFsdbdC5F5yQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-20 22:45 +0200, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21cdf1c39835..6ff5eefff391 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> -- 
> 2.54.0
> 
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
bod

